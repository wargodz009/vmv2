<?php

class Sales_model extends CI_Model{
	var $table = 'orders';
	var $order_return = 'order_return';
	
	function get_single($order_id,$row = false) {
		$this->db->where('order_id',$order_id);
		$q = $this->db->get($this->table);
		if($row == true) {
			return (@$q->row()->$row?$q->row()->$row:'Invalid order');
		} else {
			return $q->row();
		}
	}
	function add_return($data) {
		$this->db->insert($this->order_return,$data);
		return true;
	}
	function get_new(){
		$this->db->where('approved_pre',0);
		return $this->db->count_all_results($this->table);
	}
	function get_done(){
		$this->db->where('approved_pre',1);
		$this->db->where('approved_post',0);
		return $this->db->count_all_results($this->table);
	}
}

?>