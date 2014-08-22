<?php

class Payment extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$this->template->load('index','index');
	}
	function all(){
		$crud = new grocery_CRUD();
		$crud->set_table('payment'); 
		$crud->set_relation('order_id','orders','form_number'); 
		$crud->required_fields('amount','order_id','datetime');
		$crud->unset_add_fields('status');
		$crud->add_action('Manage Paid Items', base_url().'assets/images/manage.png','','',array($this,'_callback_manage_paid'));
		
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _callback_manage_paid($primary_key,$row){
		$items = $this->crud_model->read('order_item',array(array('where','order_id',$row->order_id)));
		if(count($items) > 0 ) {
			return base_url().'payment/manage/'.$row->order_id.'/'.$primary_key;
		} else {
			return '#';
		}
	}
	function manage($order_id,$payment_id) {
		if(!empty($_POST)) {
			$this->crud_model->delete('payment_item',array(array('where','payment_id',$this->input->post('payment_id'))));
			foreach($this->input->post('items') as $k) {
				$data = array(
					'payment_id'=>$this->input->post('payment_id'),
					'order_item_id'=>$k['order_item_id'],
					'amount'=>$k['amount']
				);
				$this->crud_model->create('payment_item',$data);
			}
			$this->session->set_flashdata('success','Payment Details Saved!');
			redirect('payment/all');
		} else {
			$data['items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id)));
			$data['payment_details'] = $this->crud_model->read('payment',array(array('where','payment_id',$payment_id)));
			$this->template->load('index','manage_paid_items',$data);
		}
	}
	function reciept($order_id,$payment_id) {
		$data['order_info'] = $this->crud_model->read('orders',array(array('where','order_id',$order_id)));
		$data['paid_items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id),array('where','add_type','paid')));
		$data['free_items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id),array('where','add_type','free')));
		$data['payment_details'] = $this->crud_model->read('payment',array(array('where','payment_id',$payment_id)));
		$data = $this->load->view('print_paid_items',$data,true);
		$this->load->helper(array('dompdf', 'file'));
		pdf_create($data, 'reciept'.date('dmY_his').'pdf');
	}
	function to_pdf(){
		// As PDF creation takes a bit of memory, we're saving the created file in /downloads/reports/
		$pdfFilePath = FCPATH."/downloads/reports/$filename.pdf";
		$data['page_title'] = 'Hello world'; // pass data to the view
		 
		if (file_exists($pdfFilePath) == FALSE)
		{
			ini_set('memory_limit','32M'); // boost the memory limit if it's low <img src="http://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
			$html = $this->load->view('pdf_report', $data, true); // render the view into HTML
			 
			$this->load->library('pdf');
			$pdf = $this->pdf->load();
			$pdf->SetFooter($_SERVER['HTTP_HOST'].'|{PAGENO}|'.date(DATE_RFC822)); // Add a footer for good measure <img src="http://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
			$pdf->WriteHTML($html); // write the HTML into the PDF
			$pdf->Output($pdfFilePath, 'F'); // save to file because we can
		}
		 
		redirect("/downloads/reports/$filename.pdf");
	}
}

?>