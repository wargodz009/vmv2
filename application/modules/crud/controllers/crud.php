<?php

class Crud extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('crud'); 
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>