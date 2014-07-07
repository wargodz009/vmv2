<?php

class Menu_model extends CI_Model{
	var $action = 'action';
	var $permission = 'permission';

	function get_menu($role_id){
		$this->db->distinct();
		$this->db->select($this->action.'.action_id,name,module,function');
		$this->db->where('show_on_menu',1);
		$this->db->where('role_id',$role_id);
		$this->db->where('parent',null);
		$this->db->order_by('sort');
		$this->db->join($this->permission,$this->permission.'.action_id = '.$this->action.'.action_id');
		return $this->db->get($this->action)->result();
	}
	function get_sub_menu($role_id,$parent_id){
		$this->db->distinct();
		$this->db->select($this->action.'.action_id,name,module,function');
		$this->db->where('show_on_menu !=',2);
		$this->db->where('show_on_menu !=',1);
		$this->db->where('role_id',$role_id);
		$this->db->where('parent',$parent_id);
		$this->db->order_by('sort');
		$this->db->join($this->permission,$this->permission.'.action_id = '.$this->action.'.action_id');
		return $this->db->get($this->action)->result();
	}
	function is_menu_item($module,$function) {
		$this->db->where('show_on_menu',1);
		$this->db->where('module',$module);
		$this->db->where('function',$function);
		$Q = $this->db->get($this->action);
		if($Q->num_rows()>0) {
			return true;
		} else {
			return false;
		}
	}
	function get_parent($module,$function) {
		$this->db->where('show_on_menu !=',1);
		$this->db->where('module',$module);
		$this->db->where('function',$function);
		$Q = $this->db->get($this->action);
		if($Q->num_rows()>0)  {
			$parent_id = $Q->row()->parent;
		} else {
			return 'site';
		}
		$this->db->where('action_id',$parent_id);
		$Q = $this->db->get($this->action);
		if($Q->num_rows()>0)  {
			return $Q->row()->name;
		} else {
			return false;
		}
	}
	
	function menu_logged_out(){
		return array();
	}
}

?>