<?php

class Inventory extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->model('batch/batch_model');
	}
	function index($item_type_id = 'all',$year = '00',$month ='00',$day_from = '1',$day_to='31') {
		$data['month'] = $month;
		$data['year'] = $year;
		$data['day_from'] = $day_from;
		$data['day_to'] = $day_to;
		$data['item_type_id'] = $item_type_id;
		$data['item_type'] = $this->crud_model->read('item_type');
		$data['all_batches'] = $this->batch_model->get_all($item_type_id,$year,$month,$day_from,$day_to);
		$this->template->load('index','index',$data);
	}
}

?>