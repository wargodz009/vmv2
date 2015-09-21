<?php

class Rgs_model extends CI_Model{
	var $table = 'order_return';
	
	function get_single($order_id,$row = false) {
		$this->db->where('order_id',$order_id);
		$q = $this->db->get($this->table);
		if($row == true) {
			return (@$q->row()->$row?$q->row()->$row:'Invalid order');
		} else {
			return $q->row();
		}
	}
	function get_rgs($ids,$month ='',$year = '') {
		$this->db->order_by('datetime','DESC');
		$this->db->where_in('msr_id',$ids);
		if($month != '' && $year != '') {
			$this->db->where('MONTH(datetime)',$month);
			$this->db->where('YEAR(datetime)',$year);
		} 
		$res =$this->db->get($this->table);
		return $res->result();
	}
}

?>