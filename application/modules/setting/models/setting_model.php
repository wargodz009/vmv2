<?php

class Setting_model extends CI_Model{
var $table = 'setting';
	function get_setting($name) {
		$this->db->where('name',$name);
		$q = $this->db->get($this->table);
		$row = $q->row();
		return $row->value;
	}
	function get_all_settings(){
		$this->db->where('type !=','hidden');
		$q = $this->db->get($this->table);
		return $q->result();
	}
	function save($name,$value) {
		$this->db->where('name',$name);
		$q = $this->db->update($this->table,array('value'=>$value));
	}
}