<?php

class Collection extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->model('collection/collection_model');
	}
	function index($month = '00',$year ='00',$district = '00'){
		$data['month'] = ($month != '00'?$month:date('m'));
		$data['year'] = ($year != '00'?$year:date('Y'));
		$data['district'] = ($district != ''?$district:'00');
		$data['area_list'] = $this->crud_model->read('district');
		$data['collection'] = $this->collection_model->get_all($data['month'],$data['year'] );
		$this->template->load('index','index',$data);
	}
	function per_msr($msr_client_id){
		if(isset($msr_client_id) && is_numeric(get_id_from_msr_id($msr_client_id))) {
		$all_msr_client_ids = get_all_msr_client_id(get_id_from_msr_id($msr_client_id));
		$ids = array();
			if(!empty($all_msr_client_ids)) {
				foreach($all_msr_client_ids as $msr_id) {
					$ids[] = $msr_id->msr_client_id;
				}
				$all_orders = $this->crud_model->read('orders',array(array('where_in','msr_client_id',$ids),array('where','approved_pre',1),array('where','approved_post',1)));
				$order_ids = array();
				if(!empty($all_orders)) {
					foreach($all_orders as $order_id) {
						$order_ids[] = $order_id->order_id;
					}
				}
				$data['msr_name'] = get_name(get_msr_client($msr_client_id));
				$data['all_orders'] = $all_orders;
				//$data['paid_items'] = $this->crud_model->read('payment',array(array('where_in','order_id',$order_ids)));
				$this->template->load('index','per_msr',$data);
			}
		} else {
			$this->session->set_flashdata('info','Invalid MSR');
			redirect(base_url());
		}
	}
	function all_backup(){
		$crud = new grocery_CRUD();
		$crud->set_table('payment'); 
		//$crud->set_relation_n_n('payment_order_id', 'payment_orders', 'orders', 'orderid', 'paymentid', 'form_number');
		$crud->set_relation_n_n('payment_order_id', 'payment_orders', 'orders', 'orderid', 'paymentid', 'form_number');
		$crud->required_fields('amount','payment_order_id','datetime');
		$crud->callback_column('amount',array($this,'_callback_to_php'));
		$crud->callback_column('check_full_amount',array($this,'_callback_to_php'));
		$crud->unset_add_fields('status');
		//$crud->add_action('Manage Paid Items', base_url().'assets/images/manage.png','','',array($this,'_callback_manage_paid'));
		
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function all(){
		$crud = new grocery_CRUD();
		$crud->set_subject('COLLECTION'); 
		$crud->set_table('payment'); 
		$crud->unset_delete(); 
		$crud->set_relation_n_n('orders', 'payment_orders', 'orders', 'paymentid', 'orderid', 'form_number');
		$crud->unset_add_fields('status');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	
	function _callback_to_php($var,$row){
		if($var != '' || !empty($var)) {
			return 'P '.number_format($var);
		} else {
			return 'P 0.00';
		}
	}
	function dashboard(){
		$crud = new grocery_CRUD();
		$crud->set_table('payment'); 
		$crud->set_subject('COLLECTION'); 
		$crud->unset_operations();
		$crud->display_as('check_full_amount', 'Full amount');
		$crud->display_as('order_id', 'SO #');
		$crud->display_as('payment_type', 'type');
		$crud->display_as('check_number', 'check #');
		$crud->set_relation('order_id','orders','form_number'); 
		$crud->order_by('datetime','desc');
		$crud->columns('amount','order_id','payment_type','bank','check_number','check_full_amount');
		$output = $crud->render();
		return $this->load->view('grocery_crud',$output,true);
	}
	/*function _callback_manage_paid($primary_key,$row){
		$items = $this->crud_model->read('order_item',array(array('where','order_id',$row->order_id)));
		if(count($items) > 0 ) {
			return base_url().'collection/manage/'.$row->order_id.'/'.$primary_key;
		} else {
			return '#';
		}
	}*/
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
			redirect('collection/all');
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
		$this->load->view('print_paid_items',$data);
		//$data = $this->load->view('print_paid_items',$data,true);
		//$this->load->helper(array('dompdf', 'file'));
		//pdf_create($data, 'reciept'.date('dmY_his').'pdf');
	}
}

?>