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
		$crud->add_fields('batch_readable_id','access_type','item_id','supplier_id','count','recieve_date','expire_date','lot_number','on_cavite_warehouse','buy','sell');
		$crud->edit_fields('batch_readable_id','access_type','item_id','supplier_id','count','recieve_date','expire_date','lot_number','on_cavite_warehouse','buy','sell','status');
		$crud->required_fields('batch_readable_id','access_type','item_id','supplier_id','count','recieve_date','expire_date','lot_number');
		$crud->columns('batch_readable_id','access_type','item_id','supplier_id','count','sold_count','return_count','recieve_date','expire_date','on_cavite_warehouse','lot_number','buy','sell');

		$crud->callback_column('count',array($this,'_callback_to_number'));
		$crud->callback_column('sold_count',array($this,'_callback_to_number'));
		$crud->callback_column('return_count',array($this,'_callback_to_number'));
		$crud->callback_column('buy',array($this,'_callback_to_money'));
		$crud->callback_column('sell',array($this,'_callback_to_money'));
		$crud->callback_after_insert(array($this, 'log_user_after_insert'));
    	$crud->callback_after_update(array($this, 'log_user_after_update'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function log_user_after_insert($post_array,$primary_key){
		logs('add_batch','success',$primary_key);
	}
	function log_user_after_update($post_array,$primary_key){
		logs('edit_batch','success',$primary_key);
	}
	function _callback_to_money($value, $row){
		return 'P '.number_format($value,2);
	}
	function _callback_to_number($value, $row){
		return number_format($value);
	}
}

?>