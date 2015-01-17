<?php

class Collection_model extends CI_Model{
	var $table = 'payment';
	function get_all($month ='00',$year = '00'){
		if($month != '00') {
			$this->db->where('MONTH(datetime)',$month);
		}
		if($year != '00') {
			$this->db->where('YEAR(datetime)',$year);
		}
		$this->db->order_by('datetime','DESC');
		return $this->db->get($this->table)->result();
	}
}

?>