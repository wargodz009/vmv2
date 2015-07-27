<?php

class Rgs extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('order_return'); 
		$crud->fields('order_item_id','quantity','reason','msr_id','replacement','remarks');
		$crud->required_fields('order_item_id','quantity');
		$crud->unset_delete();
		$crud->unset_read();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>