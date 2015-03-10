<?php

class Collection extends MX_Controller{

	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->model('collection/collection_model');
	}
	function index($month = '00',$year ='00',$district = '00',$day_from = '1',$day_to='31'){
		$data['month'] = ($month != '00'?$month:date('m'));
		$data['year'] = ($year != '00'?$year:date('Y'));
		$data['day_from'] = $day_from;
		$data['day_to'] = $day_to;
		$data['district'] = ($district != ''?$district:'00');
		$data['area_list'] = $this->crud_model->read('district');
		if($district == '00') {
			$data['all_msr'] = $this->crud_model->read('user',array(array('where','role_id',6)));
		} else {
			$data['all_msr'] = $this->crud_model->read('user',array(array('where','role_id',6),array('where','district_id',$district)));
		}
		$this->template->load('index','index',$data);
	}
	function per_msr($msr_client_id,$month = '00',$year ='00',$district = '00',$day_from = '1',$day_to='31'){
		if(isset($msr_client_id) && is_numeric(get_id_from_msr_id($msr_client_id))) {
			$all_msr_client_ids = get_all_msr_client_id($msr_client_id);
			$data['msr_client_id'] = $msr_client_id;
			$data['month'] = ($month != '00'?$month:date('m'));
			$data['year'] = ($year != '00'?$year:date('Y'));
			$data['day_from'] = $day_from;
			$data['day_to'] = $day_to;
			$data['district'] = ($district != ''?$district:'00');
			$data['area_list'] = $this->crud_model->read('district');
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

				$data['msr_name'] = get_name(get_id_from_msr_id($msr_client_id));
				$data['all_orders'] = $order_ids;
				$this->template->load('index','per_msr',$data);
			}
		} else {
			$this->session->set_flashdata('info','Invalid MSR');
			redirect(base_url());
		}
	}
	function all(){
		$crud = new grocery_CRUD();
		$crud->set_subject('COLLECTION');
		$crud->set_table('payment');
		$crud->display_as('datetime','Check Date');
		$crud->unset_delete();
		$crud->set_relation_n_n('orders', 'payment_orders', 'orders', 'paymentid', 'orderid', 'form_number');
		$crud->display_as('orders','PR/OR #');
		//$crud->add_action('Manage Paid Items', base_url().'assets/images/manage.png','','',array($this,'_callback_manage_paid'));
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
		$crud->unset_operations();
		$crud->columns('bank','check_number','amount','orders');
		$crud->display_as('orders','DR/SI applied');
		$crud->set_subject('COLLECTION');
		$crud->set_table('payment');
		$crud->unset_delete();
		$crud->set_relation_n_n('orders', 'payment_orders', 'orders', 'paymentid', 'orderid', 'form_number');
		//$crud->add_action('Manage Paid Items', base_url().'assets/images/manage.png','','',array($this,'_callback_manage_paid'));
		$output = $crud->render();
		return $this->load->view('grocery_crud',$output,true);
	}
	function _callback_manage_paid($primary_key,$row){
		$items = $this->crud_model->read('payment_orders',array(array('where','paymentid',$row->payment_id)));
		if(count($items) > 0 ) {
			return base_url().'collection/manage/'.$row->payment_id.'/'.$primary_key;
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
			redirect('collection/all');
		} else {
			$data['items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id)));
			$data['payment_details'] = $this->crud_model->read('payment',array(array('where','payment_id',$payment_id)));
			$this->template->load('index','manage_paid_items',$data);
		}
	}
	function reciept($order_id,$payment_id = '') {
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