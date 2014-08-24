<?php

class Sales extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->model('batch/batch_model');
		$this->load->model('sales/sales_model');
	}
	function index(){
		
		$this->template->load('index','index');
	}
	function all(){
		if($this->session->userdata('role_id') == 1) {
			$info = '';
			$new = $this->sales_model->get_new();
			if($new > 0) $info = 'You have <b>'.$new.'</b> new order(s) to approve.<br />';
			$done = $this->sales_model->get_done();
			if($done > 0 && $new > 0) {
				$info .= 'You have <b>'.$done.'</b> new order(s) to complete. ';
			} else {
				if($done > 0) {
					$info = 'You have <b>'.$done.'</b> new order(s) to complete. ';	
				}
			}
			if($info) {
				$this->session->set_userdata('info',$info);
			} 
		}
		$crud = new grocery_CRUD();
		$crud->set_table('orders'); 
		$crud->fields('form_number','msr_client_id','discount','discount_type'); 
		$crud->columns('msr_client_id','discount','discount_type','form_number'); 
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->callback_field('msr_client_id',array($this,'add_field_callback_1'));
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_name'));
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->add_action('Set Returned', base_url().'assets/images/returned.png','','',array($this,'_callback_filter_order'));
		$crud->add_action('Cancel Order', base_url().'assets/images/cancel.png','','',array($this,'_callback_filter_cancel'));
		$crud->add_action('Print SO Form', base_url().'assets/images/print.png','','',array($this,'_callback_print_paid'));
		if($this->session->userdata('role_id') == 1) {
			$crud->add_action('Approve Order', base_url().'assets/images/approve.gif','','',array($this,'_callback_filter_approve'));
			$crud->add_action('Set as Completed', base_url().'assets/images/complete.gif','','',array($this,'_callback_complete_order'));
		}
		$crud->order_by('approved_pre','asc');
		$crud->order_by('approved_post','asc');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function dashboard(){
		$crud = new grocery_CRUD();
		$crud->set_table('orders'); 
		$crud->set_subject('SALES'); 
		$crud->unset_operations();
		$crud->fields('form_number','msr_client_id','discount','discount_type'); 
		$crud->columns('msr_client_id','discount','discount_type','form_number'); 
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_name'));
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->order_by('order_date','desc');
		$output = $crud->render();
		$this->load->view('grocery_crud',$output);
	}
	function _callback_print_paid($primary_key,$row){
		$items = $this->crud_model->read('orders',array(array('where','order_id',$row->order_id),array('where','approved_post',1)));
		if($items) {
			return base_url().'payment/reciept/'.$row->order_id.'/'.$primary_key;
		} else {
			return '#';
		}
	}
	function _callback_filter_approve($primary_key,$row){
		if($row->cancel_date == null) {
			if($row->approved_pre == 0 && $row->approved_post == 0 ) {
				return base_url().'sales/set_approved/'.$primary_key;
			}
		}
		return '#';
	}
	function _callback_complete_order($primary_key,$row){
		if($row->cancel_date == null) {
			if($row->approved_pre != 0 && $row->approved_post == 0) {
				if($this->crud_model->read('payment',array(array('where','order_id',$row->order_id)))) {

				}
				return base_url().'sales/set_complete/'.$primary_key;
			}
		}
		return '#';
	}
	function _callback_filter_cancel($primary_key,$row){
		if($row->approved_pre == 0 && $row->approved_post == 0) {
			if($row->cancel_date != null) {
				return '#';
			} else {
				return base_url().'sales/set_cancelled/'.$primary_key;
			}
		} 
		return '#';
	}
	function _callback_filter_order($primary_key,$row){
		if($row->approved_pre != 0 && $row->approved_post != 0) {
			if($row->return_id == 0) {
				return base_url().'sales/set_returned/'.$primary_key;
			} else {
				return '#';
			}
		} 
		return '#';
	}
	function _log_user_after_insert($post_array,$primary_key){
		logs('add_order','success',$primary_key);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_order','success',$primary_key);
	}
	function _log_user_after_insert2($post_array,$primary_key){
		logs('add_order_details','success',$primary_key);
	}
	function _log_user_after_update2($post_array,$primary_key){
		logs('edit_order_details','success',$primary_key);
	}
	function item(){
		$crud = new grocery_CRUD();
		$crud->set_table('order_item'); 
		$crud->set_relation('order_id','orders','form_number'); 
		$crud->set_relation('batch_id','batch','batch_readable_id'); 
		$crud->callback_after_insert(array($this, '_log_user_after_insert2'));
		$crud->callback_after_update(array($this, '_log_user_after_update2'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function add_field_callback_1($value, $primary_key) {
	    $return_str =  '<select id="field-user" name="msr_client_id" size="8" class="chosen-multiple-select" data-placeholder="Select User" style="width:512px">';
	    $all = $this->user_model->get_all_msr_client();
	    foreach($all->result() as $row) {
	    	$return_str .= '<option value="'.$row->msr_client_id.'" '.($value==$row->msr_client_id?'Selected=true':'').'>'.get_name($row->msr_id).' -> '.get_name($row->client_id).'</option>';
    	}
	    return $return_str.'</select><div class="clear"></div>';
	}
	function _callback_msr_name($value, $row){
		return get_name($value);
	}
	function set_returned($order_id) {
		if($this->input->post('submit') != '') {
			$update['return_id'] = 1;
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$items = $this->input->post('items');
			if(!empty($items)) {
				foreach ($items as $item) {
					$data = array(
						'order_item_id'=>$item['order_item_id'],
						'quantity'=>$item['quantity'],
						'reason'=>$item['reason']
					);
					$this->sales_model->add_return($data);
					$this->batch_model->increment_return($item['batch_id'],$item['quantity']);
				}
			}
			$this->session->set_flashdata('success','Order Returned!');
			redirect('order/all');
		} else {
			$data['order_id'] = $order_id;
			if($this->crud_model->valid('orders','order_id',$order_id)) {
				$data['order_details'] = $this->crud_model->read('orders',array(array('where','order_id',$order_id)));
				$data['items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id)));
				$this->template->load('index','order_return_form',$data);
			} else {
				$this->session->set_flashdata('danger','not a valid order!');
				redirect('/');
			}
		}
	}
	function set_cancelled($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('orders','order_id',$order_id)) {
			$update['cancel_date'] = date('Y-m-d');
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$this->session->set_flashdata('success','Order Cancelled!');
			redirect('order/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
	function set_approved($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('orders','order_id',$order_id)) {
			$update['approved_pre'] = 1;
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$order_details = $this->crud_model->read('orders',array(array('where','order_id',$order_id)));
			$this->session->set_flashdata('success','Order Approved!');
			redirect('order/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
	function set_complete($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('orders','order_id',$order_id)) {
			$update['approved_post'] = 1;
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$order_details = $this->crud_model->read('order_item',array(array('where','order_id',$order_id)));
			if(!empty($order_details)) {
				foreach($order_details as $order) {
					$this->batch_model->increment($order->batch_id,$order->quantity);
				}
			}
			$this->session->set_flashdata('success','Order Completed!');
			redirect('sales/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
}

?>