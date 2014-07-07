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

		$crud->add_fields('name','item_type_id','generic_name','description','price_standard');
		$crud->edit_fields('name','item_type_id','generic_name','description','price_standard','status');
		
		$crud->columns('name','item_type_id','generic_name','description','price_standard','status');
		
		$crud->display_as('item_type_id','Item Type');
		$crud->display_as('price_standard','Standard Pricing');
		
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		
		$crud->required_fields('name','item_type_id','generic_name','description');
		
		$crud->callback_column('price_standard',array($this,'_callback_to_money'));
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->callback_after_delete(array($this, '_log_user_after_delete'));
		
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _log_user_after_insert($post_array,$primary_key){
		logs('add_item','success',$primary_key);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_item','success',$primary_key);
	}
	function _log_user_after_delete($post_array,$primary_key){
		logs('delete_item','success',$primary_key);
	}
	function _callback_to_money($value, $row){
		return 'P '.number_format($value,2);
	}
}

?>