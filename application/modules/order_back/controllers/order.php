<?php

class Order extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->model('order/order_model');
	}
	function index(){
		$this->template->load('index','index');
	}
	function all(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->unset_delete(); 
		$crud->required_fields('form_number','msr_client_id','batch_id','quantity','price');
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->set_relation('batch_id','batch','batch_readable_id'); 
		$crud->columns('form_number','msr_client_id','batch_id','quantity','price','discount');
		$crud->add_fields('form_number','msr_client_id','batch_id','quantity','price','discount');
		$crud->edit_fields('form_number','msr_client_id','batch_id','quantity','price','discount');
		$crud->callback_field('msr_client_id',array($this,'add_field_callback_1'));
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_name'));
		$crud->add_action('Set Returned', base_url().'assets/images/returned.png','','',array($this,'_callback_filter_order'));
		$crud->add_action('Cancel Order', base_url().'assets/images/cancel.png','','',array($this,'_callback_filter_cancel'));
		if($this->session->userdata('role_id') == 1) {
			$crud->add_action('Approve Order', base_url().'assets/images/approve.gif','','',array($this,'_callback_filter_approve'));
		}
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _callback_filter_approve($primary_key,$row){
		if($row->approved_pre == 0) {
			return base_url().'order/set_approved/'.$primary_key;
		}
		return '#';
	}
	function _callback_filter_cancel($primary_key,$row){
		if($row->approved_pre != 0 && $row->approved_post != 0) {
			if($row->cancel_date != null) {
				return '#';
			} else {
				return base_url().'order/set_canceled/'.$primary_key;
			}
		} 
		return '#';
	}
	function _callback_filter_order($primary_key,$row){
		if($row->approved_pre == 0 && $row->approved_post == 0) {
			if($row->return_id == null) {
				return base_url().'order/set_returned/'.$primary_key;
			} else {
				return '#';
			}
		} 
		return '#';
	}
	function add_field_callback_1($value, $primary_key) {
	    $return_str =  '<select id="field-user" name="msr_client_id" size="8" class="chosen-multiple-select" data-placeholder="Select User" style="width:512px">';
	    $all = $this->user_model->get_all_msr_client();
	    foreach($all->result() as $row) {
	    	$return_str .= '<option value="'.$row->msr_client_id.'">'.get_name($row->msr_id).' -> '.get_name($row->client_id).'</option>';
    	}
	    return $return_str.'</select><div class="clear"></div>';
	}
	function _callback_msr_name($value, $row){
		return get_name($value);
	}
	function pending(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->set_relation('batch_id','batch','batch_readable_id');
		$crud->unset_add(); 
		$crud->where('approved_pre',0);
		$crud->unset_edit(); 
		$crud->unset_delete(); 
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_name'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function cancelled(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->set_relation('batch_id','batch','batch_readable_id');
		$crud->where('cancel_date !=','');
		$crud->unset_add(); 
		$crud->unset_edit(); 
		$crud->unset_delete();
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_name'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function returned(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->set_relation('batch_id','batch','batch_readable_id');
		$crud->where('return_id !=','');
		$crud->unset_add(); 
		$crud->unset_edit(); 
		$crud->unset_delete();
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_name'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function payment(){
		$crud = new grocery_CRUD();
		$crud->set_table('payment'); 
		$crud->set_relation('order_id','order','form_number'); 
		$crud->add_fields('amount','order_id','bank','check_number','check_full_amount','datetime');
		$crud->unset_edit(); 
		$crud->unset_delete();
		$crud->add_action('add Payment',base_url().'assets/images/money.png',base_url().'order/pay/');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function set_returned($order_id) {
		if($this->input->post('submit') != '') {
			$data['order_id'] = $this->input->post('order_id');
			$data['reason'] = $this->input->post('reason');
			$return_id = $this->order_model->add_return($data);
			$update['return_id'] = $return_id;
			$this->crud_model->update('order',$update,array(array('where','order_id',$order_id)));
			$this->session->set_flashdata('success','Order Returned!');
			redirect('order/all');
		} else {
			$data['order_id'] = $order_id;
			if($this->crud_model->valid('order','order_id',$order_id)) {
				$data['order_details'] = $this->crud_model->read('order',array(array('where','order_id',$order_id)));
				$this->template->load('index','order_return_form',$data);
			} else {
				$this->session->set_flashdata('danger','not a valid order!');
				redirect('/');
			}
		}
	}
	function set_canceled($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('order','order_id',$order_id)) {
			$update['cancel_date'] = date('Y-m-d');
			$this->crud_model->update('order',$update,array(array('where','order_id',$order_id)));
			$this->session->set_flashdata('success','Order Cancelled!');
			redirect('order/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
	function set_approved($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('order','order_id',$order_id)) {
			$update['approved_pre'] = 1;
			$this->crud_model->update('order',$update,array(array('where','order_id',$order_id)));
			$order_details = $this->crud_model->read('order',array(array('where','order_id',$order_id)));
			$this->load->model('batch/batch_model');
			$this->batch_model->decrease_batch($order_details->batch_id,$order_details->quantity);
			$this->session->set_flashdata('success','Order Approved!');
			redirect('order/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
}
