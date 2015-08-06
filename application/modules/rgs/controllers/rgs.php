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
		$crud->callback_add_field('msr_id',array($this,'msr_id_field_add_callback'));
		$crud->callback_edit_field('msr_id',array($this,'msr_id_field_add_callback'));
		$crud->callback_add_field('order_item_id',array($this,'order_item_id_field_add_callback'));
		$crud->callback_edit_field('order_item_id',array($this,'order_item_id_field_add_callback'));
		$crud->required_fields('order_item_id','quantity');
		$crud->callback_column('msr_id',array($this,'_callback_msr_id'));
		$crud->callback_column('order_item_id',array($this,'_callback_order_item_id'));
		$crud->unset_delete();
		$crud->unset_read();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function msr_id_field_add_callback()
	{
		$msr_client = $this->crud_model->read('msr_client');
		$ret =  '<select id="field-msr_id" name="msr_id" class="form-control :required">
		<option value="0">OFFICE ACCOUNT</option>
		';
		if(!empty($msr_client)) {
			foreach($msr_client as $msr) {
				$ret .= '<option value="'.$msr->msr_client_id.'">'.get_name($msr->msr_id).' -> '.get_name($msr->client_id).'</option>';
			}
		}
		$ret .='</select>';
		return $ret;
	}
	function order_item_id_field_add_callback()
	{
		$orders = $this->crud_model->read('orders');
		$ret =  '<select id="field-order_item_id" name="order_item_id" class="form-control :required">';
		if(!empty($orders)) {
			foreach($orders as $ord) {
				$ret .= '<option value="'.$ord->order_id.'">'.$ord->form_number.'</option>';
			}
		}
		$ret .='</select>';
		return $ret;
	}
	function _callback_msr_id($value, $row)
	{
		if($value == 0) {
			return 'OFFICE ACCOUNT';
		} else {
			return get_name(get_id_from_msr_id($value)) .' -> '.get_name(get_msr_client($value,'client_id'));
		}
	}
	function _callback_order_item_id($value, $row)
	{
		return get_order_info(get_order_id_from_order_item_id($value),'form_number');
	}
}

?>