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
		$crud->display_as('buy', 'Cost');
		$crud->display_as('sell', 'Catalog Price');
		$crud->field_type('recieve_date', 'date');
		$crud->field_type('expire_date', 'date');
		$crud->field_type('user_id', 'hidden', $this->session->userdata('user_id'));
		$crud->field_type('sold_count', 'hidden');
		$crud->field_type('expire_count', 'hidden');
		$crud->field_type('return_count', 'hidden');
		$crud->field_type('status', 'hidden');
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$crud->display_as('item_id', 'Product Name');
		$crud->required_fields('batch_readable_id','access_type','item_id','supplier_id','count','recieve_date','expire_date','lot_number');
		$crud->fields('item_id','batch_readable_id','supplier_id','count','access_type','buy','sell','recieve_date','expire_date','lot_number','user_id');
		$crud->columns('batch_readable_id','access_type','item_id','supplier_id','count','sold_count','return_count','recieve_date','expire_date','lot_number','buy','sell','status');

		$crud->callback_column('status',array($this,'_callback_to_status'));
		$crud->callback_column('count',array($this,'_callback_to_number'));
		$crud->callback_column('sold_count',array($this,'_callback_to_number'));
		$crud->callback_column('return_count',array($this,'_callback_to_number'));
		$crud->callback_column('buy',array($this,'_callback_to_money'));
		$crud->callback_column('sell',array($this,'_callback_to_money'));
		$crud->callback_after_insert(array($this, 'log_user_after_insert'));
    		$crud->callback_after_update(array($this, 'log_user_after_update'));
    		$crud->order_by('batch_id','desc');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function dashboard($item_type_id = '1'){
		$crud = new grocery_CRUD();
		$crud->set_table('batch'); 
		$crud->set_subject('PRODUCT INVENTORY -' . get_item_type($item_type_id)); 
		$crud->unset_operations();
		$crud->set_relation('item_id','item','name');
		$crud->set_relation('supplier_id','supplier','name');
		$crud->display_as('batch_readable_id', 'Batch #');
		$crud->display_as('supplier_id', 'Supplier');
		$crud->display_as('item_id', 'Item');
		$crud->display_as('buy', 'Cost');
		$crud->display_as('sell', 'Catalog Price');
		$crud->field_type('recieve_date', 'date');
		$crud->field_type('expire_date', 'date');
		$crud->field_type('user_id', 'hidden', 1);
		$crud->field_type('sold_count', 'hidden');
		$crud->field_type('expire_count', 'hidden');
		$crud->field_type('return_count', 'hidden');
		$crud->field_type('status', 'hidden');
		$crud->where('item_type_id', $item_type_id);
		$crud->required_fields('batch_readable_id','access_type','item_id','supplier_id','count','recieve_date','expire_date','lot_number');
		$crud->columns('batch_readable_id','access_type','item_id','supplier_id','count','sold_count','return_count','recieve_date','expire_date','lot_number','buy','sell','status');

		$crud->callback_column('status',array($this,'_callback_to_status'));
		$crud->callback_column('count',array($this,'_callback_to_number'));
		$crud->callback_column('sold_count',array($this,'_callback_to_number'));
		$crud->callback_column('return_count',array($this,'_callback_to_number'));
		$crud->callback_column('buy',array($this,'_callback_to_money'));
		$crud->callback_column('sell',array($this,'_callback_to_money'));
		$crud->callback_after_insert(array($this, 'log_user_after_insert'));
    		$crud->callback_after_update(array($this, 'log_user_after_update'));
    		$crud->order_by('batch_id','desc');
		$output = $crud->render();
		return $this->load->view('grocery_crud',$output,true);
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
	function _callback_to_status($value, $row){
		$percent = str_replace(",","",$row->sold_count) / str_replace(",","",$row->count);
		$percentage = number_format( $percent * 100 );
		if($percentage < $this->setting_model->get_setting('critical_limit')) {
			return '<img src="'.base_url().'assets/images/warning-icon-green.png" alt="">';
		}
		return '<img src="'.base_url().'assets/images/warning-icon.png" alt="">';
	}
}

?>