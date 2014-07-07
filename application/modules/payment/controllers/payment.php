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
		$crud->add_action('Manage Paid Items', base_url().'assets/images/manage.png','','',array($this,'_callback_manage_paid'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _callback_manage_paid($primary_key,$row){
		$items = $this->crud_model->read('order_item',array(array('where','order_id',$row->order_id)));
		if(count($items) > 1 ) {
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
}

?>