<?php

class Supplier extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('supplier'); 
		$crud->unset_columns('datetime');
		$crud->fields('name');
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>