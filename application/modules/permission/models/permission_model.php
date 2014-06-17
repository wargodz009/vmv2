<?php

class Permission_model extends CI_Model{
	var $permission = 'permission';
	var $action = 'action';
	var $role = 'role';
	
	function get_action($module,$function,$single = false){
		$this->db->where('module',$module);
		$this->db->where('function',$function);
		$Q = $this->db->get($this->action);
		if($Q->num_rows() > 0) {
			if($single === false) {
				return $Q->result();
			} else {
				return $Q->row()->$single;
			}
		}
		return false;
	}
	function get_permission($role_id,$action_id){
		$this->db->where('role_id',$role_id);
		$this->db->where('action_id',$action_id);
		return $this->db->get($this->permission)->result();
	}
	function check($role_id,$module,$function) {
		$action_id = $this->get_action($module,$function,'action_id');
		if( $action_id ) {
			if($this->get_permission($role_id,$action_id)) {
				return true;
			}
		}
		return false;
	}
	
}

?>