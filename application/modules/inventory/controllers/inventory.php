<?php

class Inventory extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->model('batch/batch_model');
	}
	function index($item_type_id = 'all',$year = '00',$month ='00',$day_from = '1',$day_to='31') {
		$data['expire_critical'] = $this->get_notif_critical();
		if(count($data['expire_critical'] > 0)) {
			$this->load->helper('cookie');
			set_cookie('expire_critical_shown','yes');
			$this->session->set_flashdata('success','<a href="'.base_url().'inventory/near_expire">'.count($data['expire_critical']).'</a> Items is Expiring Near!');
			redirect('inventory/all/'.$item_type_id.'/'.$year.'/'.$month.'/'.$day_from.'/'.$day_to);
		}
	}
	function all($item_type_id = 'all',$year = '00',$month ='00',$day_from = '1',$day_to='31') {
		$data['month'] = $month;
		$data['year'] = $year;
		$data['day_from'] = $day_from;
		$data['day_to'] = $day_to;
		$data['item_type_id'] = $item_type_id;
		$data['item_type'] = $this->crud_model->read('item_type');
		$data['all_batches'] = $this->batch_model->get_all($item_type_id,$year,$month,$day_from,$day_to);
		$this->template->load('index','index',$data);
	}
	function get_notif_critical() {
		$date = date('Y-m-d');
		return $this->db->query("SELECT * FROM batch WHERE expire_date < DATE_ADD(NOW(),INTERVAL ".$this->setting_model->get_setting('critical_expire')." MONTH)")->result();
	}
	function near_expire() {
		$data['all_batches'] = $this->db->query("SELECT * FROM batch WHERE expire_date < DATE_ADD(NOW(),INTERVAL ".$this->setting_model->get_setting('critical_expire')." MONTH)")->result();
		$this->template->load('index','near_expire',$data);
	}
}

?>