<?php

class Permission extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('role'); 
		$crud->unset_delete(); 
		$crud->set_relation_n_n('action', 'permission', 'action', 'role_id', 'action_id', 'name');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>