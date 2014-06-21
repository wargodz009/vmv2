<?php

class Item extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('item'); 
		$crud->set_relation('item_type_id','item_type','name');
		$crud->unset_columns('datetime');
		$crud->fields('name','item_type_id','generic_name','description','price_standard','status');
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>