<?php

class Batch_model extends CI_Model{
var $table = 'batch';
var $items = 'items';
var $suppliers = 'suppliers';
	function increment($batch_id,$quantity){
		$this->db->where('batch_id', $batch_id);
		$this->db->set('sold_count', 'sold_count+'.$quantity, FALSE);
		$this->db->update($this->table);
		if($this->db->affected_rows()>0) {
			return true;
		} else {
			return false;
		}
	}
	function decrement($batch_id,$quantity){
		$this->db->where('batch_id', $batch_id);
		$this->db->set('sold_count', 'sold_count-'.$quantity, FALSE);
		$this->db->update($this->table);
		if($this->db->affected_rows()>0) {
			return true;
		} else {
			return false;
		}
	}
	function increment_return($batch_id,$quantity){
		$this->db->where('batch_id', $batch_id);
		$this->db->set('return_count', 'return_count+'.$quantity, FALSE);
		$this->db->set('sold_count', 'sold_count-'.$quantity, FALSE);
		$this->db->update($this->table);
		if($this->db->affected_rows()>0) {
			return true;
		} else {
			return false;
		}
	}
	function get_single($batch_id,$row = false) {
		$this->db->where('batch_id',$batch_id);
		$q = $this->db->get($this->table);
		if($row == true) {
			return (@$q->row()->$row?$q->row()->$row:false);
		} else {
			return $q->row();
		}
	}
}