<?php

class Ar extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('ar_old'); 
		$crud->unset_read(); 
		$crud->fields('dr_date','dr_num','amount','msr_client_id');
		$crud->required_fields('dr_date','dr_num','msr_client_id','amount');
		$crud->callback_add_field('msr_client_id',array($this,'msr_client_id_field_add_callback'));
		$crud->callback_edit_field('msr_client_id',array($this,'msr_client_id_field_add_callback'));
		$crud->callback_column('msr_client_id',array($this,'_callback_msr_client_id'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
		
	}
	function msr_client_id_field_add_callback()
	{
		$msr_client = $this->crud_model->read('msr_client');
		$ret =  '<select id="field-msr_client_id" name="msr_client_id" class="form-control :required">
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
	function _callback_msr_client_id($value, $row)
	{
		if($value == 0) {
			return 'OFFICE ACCOUNT';
		} else {
			return get_name(get_id_from_msr_id($value)) .' -> '.get_name(get_msr_client($value,'client_id'));
		}
	}
}

?>