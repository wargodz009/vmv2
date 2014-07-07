<?php

class Report extends MX_Controller{
	
	function __construct(){
		parent::__construct();
	}
	function index() {
		$this->template->load('index','index');
	}
	function generate() {
		$this->template->load('index','generate_report_form');
	}
	function view() {
		$this->template->load('index','view_report');
	}
	function type() {
		$crud = new grocery_CRUD();
		$crud->set_table('report_type'); 
		$crud->set_relation_n_n('roles', 'report_user', 'role', 'report_type_id', 'role_id', 'name');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>