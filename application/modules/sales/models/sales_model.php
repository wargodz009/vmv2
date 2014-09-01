<?php

class Sales_model extends CI_Model{
	var $table = 'orders';
	var $order_item = 'order_item';
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
	function get_orders($filter = array()){
		if(is_array($filter) && !empty($filter)) {
			foreach ($filter as $key => $value) {
				$this->db->where($key,$value,false);
			}
		}
		return $this->db->get($this->table)->result();
	}
	function get_sales($ids,$month,$year) {
		$this->db->order_by('order_date','DESC');
		$this->db->where_in('msr_client_id',$ids);
		$this->db->where('MONTH(order_date)',$month);
		$this->db->where('YEAR(order_date)',$year);
		$res =$this->db->get($this->table);
		return $res->result();
	}
	function get_items($order_id) {
		$this->db->where('order_id',$order_id);
		return $this->db->get($this->order_item)->result();
	}
}

?>