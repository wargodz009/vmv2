<?php

class User_model extends CI_Model{
	var $table = 'user';
	var $msr_client = 'msr_client';
	
	function login($username,$password){
		
	}
	function validate_user($username,$password,$return_info = false) {
		$this->db->where('email',$username);
		$this->db->where('password',$password);
		$user = $this->db->get($this->table);
		if($return_info == false) {
			if($user->num_rows()>0) {
				return true;
			} else {
				return false;
			}
		} else {
			return $user->row();
		}
	}
	function get_current_user(){
		$id = $this->session->userdata('user_id');
		if($id) {
			$this->db->where('user_id',$id);
			$user = $this->db->get($this->table);
			return $user->row();
		} else {
			return false;
		}
	}
	function get_single($id,$in_email = false,$row = false) {
		if($in_email === true) {
			$this->db->where('email',$id);
		} else {
			$this->db->where('user_id',$id);
		}
		$q = $this->db->get($this->table);
		if($row == true) {
			return (@$q->row()->$row?$q->row()->$row:'Invalid user');
		} else {
			return $q->row();
		}
	}
	function get_all_clients(){
		$this->db->where('role_id',5);
		return $this->db->get($this->table);
	}
	function get_all_clients_by_msr_id($msr_id){
		$this->db->where('msr_id',$msr_id);
		return $this->db->get($this->msr_client)->result();
	}
	function get_all_msr(){
		$this->db->where('role_id',6);
		return $this->db->get($this->table);
	}
	function get_all_msr_client(){
		return $this->db->get($this->msr_client);
	}
	function is_owned($msr_id,$client_id){
		$this->db->where('msr_id',$msr_id);
		$this->db->where('client_id',$client_id);
		$Q = $this->db->get($this->msr_client);
		if($Q->num_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	function get_msr_client($msr_client_id,$get_what = 'msr_id') {
		$this->db->where('msr_client_id',$msr_client_id);
		$Q = $this->db->get($this->msr_client);
		if($get_what != '') {
			return $Q->row()->$get_what;
		}
		return $Q->result();
	}
	function get_user_by_district($district_id,$user_type = '') {
		if(!empty($user_type)) {
			$this->db->where('role_id',$user_type);
		}
		$this->db->where('district_id',$district_id);
		$Q = $this->db->get($this->table);
		return $Q->result();
	}
}
?>