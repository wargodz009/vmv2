<?php

class Rgs extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('rgs'); 
		$crud->fields('dr_si_num','amount','date');
		$crud->required_fields('dr_si_num','amount','date');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>