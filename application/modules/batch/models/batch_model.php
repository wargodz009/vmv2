<?php

class Batch_model extends CI_Model{
var $table = 'item_batch';
var $items = 'items';
var $suppliers = 'suppliers';
	function increment($item_batch_id,$quantity){
		$this->db->where('item_batch_id', $item_batch_id);
		$this->db->set('sold_count', 'sold_count+'.$quantity, FALSE);
		$this->db->update($this->table);
		if($this->db->affected_rows()>0) {
			return true;
		} else {
			return false;
		}
	}
	function decrement($item_batch_id,$quantity){
		$this->db->where('item_batch_id', $item_batch_id);
		$this->db->set('sold_count', 'sold_count-'.$quantity, FALSE);
		$this->db->update($this->table);
		if($this->db->affected_rows()>0) {
			return true;
		} else {
			return false;
		}
	}
}