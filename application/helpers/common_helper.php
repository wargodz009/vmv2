<?php

/*
sample usage:
logs('logout','success','logout_form');

grocery crud usage:
$crud->callback_after_insert(array($this, '_log_user_after_insert'));
$crud->callback_after_update(array($this, '_log_user_after_update'));
$crud->callback_after_delete(array($this, '_log_user_after_delete'));
function _log_user_after_insert($post_array,$primary_key){
	logs('add_item','success',$primary_key);
}
function _log_user_after_update($post_array,$primary_key){
	logs('edit_item','success',$primary_key);
}
function _log_user_after_delete($post_array,$primary_key){
	logs('delete_item','success',$primary_key);
}
*/
function logs($action,$result,$target){
	$CI =& get_instance();
	$data = array(
		'ip_address'=>$CI->input->ip_address(),
		'useragent'=>$CI->input->user_agent(),
		'user_id'=>$CI->session->userdata('user_id'),
		'role_id'=>$CI->session->userdata('role_id'),
		'action'=>$action,
		'result'=>$result,
		'target'=>$target,
		'url'=>current_url(),
		'sql'=>$CI->db->last_query()
	);
	$CI->db->insert('logs',$data);
	return true;
}
function get_role(){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	switch($CI->session->userdata('role_id')) {
		case 1 : return 'administrator'; break;
		case 2 : return 'accountant'; break;
		case 3 : return 'warehouseman'; break;
		case 4 : return 'human resource'; break;
		case 5 : return 'client'; break;
		case 6 : return 'medical representative'; break;
		default: return 'medical representative'; break;
	}
}
function get_name($user_id){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	$user = $CI->user_model->get_single($user_id);
	if($user) {
		$fname = trim($user->first_name);
		$lname = trim($user->last_name);
		$uname = trim($user->email);
		if(!empty($fname) && !empty($lname)) {
			return $lname.', '.$fname;
		} else if(empty($fname) || empty($lname)) {
			if(!empty($fname) && empty($lname)) {
				return $fname;
			} else {
				if(!empty($lname)) {
					return $lname;
				}
				if(!empty($uname)) {
					return $uname;
				}
			}
			return $lname.', '.$fname;
		} else {
			return $fname;
		}
	} else {
		return 'Unknown user:'.$user_id;
	}
}
function get_district_id($user_id){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	$user = $CI->user_model->get_single($user_id);
	if($user) {
		return $user->district_id;
	} else {
		return 1;
	}
}
function get_supplier_name($id) {
	$CI =& get_instance();
	$CI->db->where('supplier_id',$id);
	$q = $CI->db->get('supplier');
	return $q->row()->name;
}
function get_id_from_msr_id($msr_client_id){
	$CI =& get_instance();
	$CI->db->where('msr_client_id',$msr_client_id);
	$q = $CI->db->get('msr_client');
	if($q->row()) {
		return $q->row()->msr_id;
	} else {
		$CI->db->where('role_id',6);
		$q = $CI->db->get('user');
		if($q->row()) {
			return $q->row()->user_id;
		} else {
			return 'Unknown id: '.$msr_client_id;
		}
	}
}
function get_form_number($order_id){
	$CI =& get_instance();
	$CI->load->model('order/order_model');
	return $CI->order_model->get_single($order_id,'form_number');
}
function get_msr_client($msr_client_id,$what = 'msr_id'){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	return $CI->user_model->get_msr_client($msr_client_id,$what);
}
function get_msr_client_id($msr_id){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	return $CI->user_model->get_msr_client_id($msr_id);
}
function get_all_msr_client_id($msr_id){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	return $CI->user_model->get_all_msr_client_id($msr_id);
}
function get_address($user_id){
	$CI =& get_instance();
	$CI->load->model('user/user_model');
	return $CI->user_model->get_single($user_id,false,'address');
}
function unique_field_name($field_name){
    return 's'.substr(md5($field_name),0,8);
}
function get_item_name($item_id,$include_desc = false){
	$CI =& get_instance();
	$CI->db->where('item_id',$item_id);
	$Q = $CI->db->get('item');
	if($include_desc != false) {
		return $Q->row()->name;
	} else {
		return $Q->row()->name.' ('.$Q->row()->description.')';
	}
}
function is_valid_item($item_id){
	$CI =& get_instance();
	$CI->db->where('item_id',$item_id);
	$Q = $CI->db->get('item');
	if($Q->row()) { return true; }
	else { return false;}	
}
function get_item_desc($item_id){
	$CI =& get_instance();
	$CI->db->where('item_id',$item_id);
	$Q = $CI->db->get('item');
	return $Q->row()->description;
}
function get_item_id_from_batch($batch_id){
	$CI =& get_instance();
	$CI->db->where('batch_id',$batch_id);
	$Q = $CI->db->get('batch')->row();
	return $Q->item_id;
}
function get_item_id_from_order($order_id){
	$CI =& get_instance();
	$CI->db->where('order_item_id',$order_id);
	$Q = $CI->db->get('orders')->row();
	return $Q->item_id;
}
function get_batch_id_from_order($order_id){
	$CI =& get_instance();
	$CI->db->where('order_id',$order_id);
	$Q = $CI->db->get('order_item')->row();
	return $Q->batch_id;
}
function get_order_id($msr_client_ids){
	$CI =& get_instance();
	$CI->db->where_in('msr_client_id',$msr_client_ids);
	return $CI->db->get('orders')->result();
}
function get_order_item_id($order_id,$batch_id){
	$CI =& get_instance();
	$CI->db->where('order_id',$order_id);
	$CI->db->where('batch_id',$batch_id);
	$Q = $CI->db->get('order_item')->row();
	return $Q->order_item_id;
}
function get_payment_id_from_payment_orders($order_id){
	$CI =& get_instance();
	if(is_array($order_id)) {
		$CI->db->where_in('orderid',$order_id);
	} else {
		$CI->db->where('orderid',$order_id);
	}
	return $CI->db->get('payment_orders')->result();
}
function get_order_id_from_payment_orders($payment_id){
	$CI =& get_instance();
	if(is_array($payment_id)) {
		$CI->db->where_in('paymentid',$payment_id);
	} else {
		$CI->db->where('paymentid',$payment_id);
	}
	return $CI->db->get('payment_orders')->result();
}
function get_order_info($order_id,$what = ''){
	$CI =& get_instance();
	$CI->db->where('order_id',$order_id);
	$Q = $CI->db->get('orders');
	if($what != '') {
		return $Q->row()->$what;
	} else {
		return $Q->result();
	}
}
function get_order_items($order_id,$what = ''){
	$CI =& get_instance();
	$CI->db->where('order_id',$order_id);
	$Q = $CI->db->get('order_item');
	if($what != '') {
		return $Q->row()->$what;
	} else {
		return $Q->result();
	}
}
function get_paid_amount($payment_id,$order_item_id){
	$CI =& get_instance();
	$CI->db->where('payment_id',$payment_id);
	$CI->db->where('order_item_id',$order_item_id);
	$Q = $CI->db->get('payment_item')->row();
	return @$Q->amount;
}
function get_payment_info($paymentid,$orderids = false){
	$CI =& get_instance();
	$CI->db->where('paymentid',$paymentid);
	$Q = $CI->db->get('payment_orders')->result();
	if($orderids == false ) {
		return $Q;
	} else {
		$arr = array();
		foreach($Q as $orders) {
			$arr[] = $orders->orderid;
		}
		return $arr;
	}
}
function get_district_name($district_id){
	$CI =& get_instance();
	$CI->db->where('district_id',$district_id);
	$Q = $CI->db->get('district')->row();
	return @$Q->name;
}
function pretty_date($datetime){
	return date("M d, Y",strtotime($datetime));
}