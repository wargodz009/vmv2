<?php

class User_model extends CI_Model{
	var $table = 'user';
	
	function login($username,$password){
		
	}
	function validate_user($username,$password,$return_info = false) {
		$this->db->where('email',$username);
		$this->db->where('password',$password);
		$user = $this->db->get($this->table);
		if($return_info == false) {
			if($user) {
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
	
}

?>