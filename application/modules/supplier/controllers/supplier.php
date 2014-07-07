<?php

class Supplier extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('supplier'); 
		$crud->add_fields('name');
		$crud->edit_fields('name','status');
		$crud->columns('name','status');
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$crud->required_fields('name','status');
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->callback_after_delete(array($this, '_log_user_after_delete'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _log_user_after_insert($post_array,$primary_key){
		logs('add_supplier','success',$primary_key);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_supplier','success',$primary_key);
	}
	function _log_user_after_delete($post_array,$primary_key){
		logs('delete_supplier','success',$primary_key);
	}
}

?>