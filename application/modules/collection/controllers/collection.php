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
	function per_msr($msr_id,$month = '00',$year ='00',$district = '00',$day_from = '1',$day_to='31'){
		if(isset($msr_id) && is_numeric($msr_id)) {
			$all_msr_client_ids = get_all_msr_client_id($msr_id);
			$data['msr_client_id'] = $all_msr_client_ids;
			$data['month'] = ($month != '00'?$month:date('m'));
			$data['year'] = ($year != '00'?$year:date('Y'));
			$data['day_from'] = $day_from;
			$data['day_to'] = $day_to;
			$data['district'] = ($district != ''?$district:'00');
			$data['area_list'] = $this->crud_model->read('district');
			$ids = array();
			if(!empty($all_msr_client_ids)) {
				foreach($all_msr_client_ids as $msr_ids) {
					$ids[] = $msr_ids->msr_client_id;
				}
				$all_orders = $this->crud_model->read('orders',array(array('where_in','msr_client_id',$ids),array('where','approved_pre',1),array('where','approved_post',1)));
				$order_ids = array();
				if(!empty($all_orders)) {
					foreach($all_orders as $order_id) {
						$order_ids[] = $order_id->order_id;
					}
				}

				$data['msr_name'] = get_name($msr_id);
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
		$crud->unset_add();
		$crud->fields('amount','bank','check_number','check_full_amount','pr_or_number');
		$crud->columns('datetime','msr_client_id','pr_or_number','date_of_cheque','check_full_amount','pdc','check_number','dr_applied');
		$crud->display_as('datetime','DATE');
		$crud->display_as('msr_client_id','NAME OF CLIENT');
		$crud->display_as('pr_or_number','PR/OR #');
		$crud->display_as('date_of_cheque','CHECK DATE');
		$crud->display_as('check_full_amount','DATED/CASH');
		$crud->display_as('pdc','PDC');
		$crud->display_as('check_number','BANK/CHECK');
		$crud->display_as('dr_applied','APPLIED DR/SI');
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
	function dashboard($grocery_crud = 'grocery_crud'){
		$crud = new grocery_CRUD();
		$crud->set_theme('flexigrid_mini'); 
		$crud->unset_operations();
		$crud->columns('datetime','msr_client_id','pr_or_number','date_of_cheque','check_full_amount','pdc','check_number','dr_applied');
		//$crud->fields('amount','bank','check_number','check_full_amount','pr_or_number');
		$crud->display_as('datetime','DATE');
		$crud->display_as('msr_client_id','NAME OF CLIENT');
		$crud->display_as('pr_or_number','PR/OR #');
		$crud->display_as('date_of_cheque','CHECK DATE');
		$crud->display_as('check_full_amount','DATED/CASH');
		$crud->display_as('pdc','PDC');
		$crud->display_as('check_number','BANK/CHECK');
		$crud->display_as('dr_applied','APPLIED DR/SI');
		$crud->set_subject('COLLECTION');
		$crud->set_table('payment');
		$crud->callback_column('msr_client_id',array($this,'_callback_msr_client_id'));
		$crud->callback_column('datetime',array($this,'_callback_datetime'));
		$crud->unset_delete();
		//$crud->set_relation_n_n('orders', 'payment_orders', 'orders', 'paymentid', 'orderid', 'form_number');
		//$crud->add_action('Manage Paid Items', base_url().'assets/images/manage.png','','',array($this,'_callback_manage_paid'));
		$output = $crud->render();
		return $this->load->view($grocery_crud,$output,true);
	}
	public function _callback_msr_client_id($value, $row)
	{
	  return get_name(get_id_from_msr_id($value));
	}
	public function _callback_datetime($value, $row)
	{
	  return pretty_date($value);
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
	function add_new(){
		if(isset($_POST) && !empty($_POST)) {
			if($this->crud_model->create('payment',$_POST)) {
				$this->session->set_flashdata('success','Payment Details Saved!');
			} else {
				$this->session->set_flashdata('info','Payment Details Not Saved!');
			}
			redirect('collection');
		} else {
			$data['msr_client'] = $this->crud_model->read('msr_client');
			$this->template->load('index','add_new_collection',$data);
		}
	}
	function get_dr($id) {
		$this->output->enable_profiler(false);
		echo json_encode($this->crud_model->read('orders',array(array('where','msr_client_id',$id),array('where','approved_pre',1),array('where','approved_post',1))));
	}
}

?>