<?php

class Collection_model extends CI_Model{
	var $table = 'payment';
	var $payment_orders = 'payment_orders';
	function get_all($month ='00',$year = '00',$day_from = '1',$day_to='31',$all_ids = array()){
		if($month != '00') {
			$this->db->where('MONTH(datetime)',$month);
		}
		if($year != '00') {
			$this->db->where('YEAR(datetime)',$year);
		}
		if(!empty($all_ids)) {
			$this->db->where_in('payment_id' ,$all_ids);
		}
		if($month != '00' && $year != '00') {
			$this->db->where('DAY(datetime) >=' ,$day_from);
			$this->db->where('DAY(datetime) <=',$day_to);
		}
		$this->db->order_by('datetime','DESC');
		return $this->db->get($this->table)->result();
	}
}

?>