<?php

class User extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('user'); 
		$crud->display_as('district_id','District');
		$crud->display_as('role_id','Role');
		$crud->set_relation('district_id','district','name');
		$crud->set_relation('role_id','role','name');
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>