<?php

class District extends MX_Controller{
	
	function __construct() {
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function info($district_id) {
		$data[] = array('where','district_id',$district_id);
		if($this->crud_model->read('district',$data,'name')) {
			$usersFromDistrict['users'] = $this->user_model->get_user_by_district($district_id,6);
			if(!empty($usersFromDistrict)) {
				$this->template->load('index','list_user_per_district',$usersFromDistrict);
			} else {
				$this->session->set_flashdata('error','District has no user/employee yet!');
				redirect($_SERVER['HTTP_REFERER']);	
			}
		} else {
			$this->session->set_flashdata('error','not a valid district!');
			redirect('/');
		}
	
	}
	function index() {
		$crud = new grocery_CRUD();
		$crud->set_table('district'); 
		$crud->unset_delete();
		$crud->callback_column('name',array($this,'_callback_name_to_link'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _callback_name_to_link($var,$row){
		return '<a href="'.base_url().'district/info/'.$row->district_id.'">'.$var.'</a>';
	}
}

?>