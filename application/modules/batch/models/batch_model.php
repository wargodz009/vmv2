<?php

class Batch_model extends CI_Model{
var $table = 'batch';
var $item = 'item';
var $item_type = 'item_type';
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
	function get_all($item_type_id = 'all',$year ='00',$month = '00',$day_from = '1',$day_to='31',$all_ids = array()){
		if($month != '00') {
			$this->db->where('MONTH(recieve_date)',$month);
		}
		if($year != '00') {
			$this->db->where('YEAR(recieve_date)',$year);
		}
		if(!empty($all_ids)) {
			$this->db->where_in('payment_id' ,$all_ids);
		}
		if($month != '00' && $year != '00') {
			$this->db->where('DAY(recieve_date) >=' ,$day_from);
			$this->db->where('DAY(recieve_date) <=',$day_to);
		}
		if($item_type_id != 'all') {
			$this->db->join('item', $this->table.'.item_id = '.$this->item.'.item_id');
			$this->db->join('item_type', $this->item.'.item_type_id = '.$this->item_type.'.item_type_id');
			$this->db->where($this->item.'.item_type_id',$item_type_id);
		}
		$this->db->order_by('recieve_date','DESC');
		return $this->db->get($this->table)->result();
	}
}