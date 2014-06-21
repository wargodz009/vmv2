<?php

class Batch extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('batch'); 
		$crud->set_relation('item_id','item','name');
		$crud->set_relation('supplier_id','supplier','name');
		$crud->display_as('batch_readable_id', 'Batch #');
		$crud->display_as('supplier_id', 'Supplier');
		$crud->display_as('item_id', 'Item');
		$crud->display_as('on_cavite_warehouse', 'cvte whse');
		$crud->field_type('recieve_date', 'date');
		$crud->field_type('expire_date', 'date');
		$crud->field_type('user_id', 'hidden', 1);
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$crud->unset_columns('count','sold','expire','buy','sell','user_id');
		$crud->fields('batch_readable_id','access_type','item_id','user_id','supplier_id','count','recieve_date','expire_date','on_cavite_warehouse','lot_number','buy','sell');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>