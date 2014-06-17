<?php

class Msr_client extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('msr_view'); 
		$crud->set_primary_key('user_id');
		$crud->unset_delete(); 
		$crud->unset_add(); 
		$crud->set_relation_n_n('user', 'msr_client', 'user', 'msr_id', 'client_id', 'user_id',NULL,array('role_id'=>5));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>