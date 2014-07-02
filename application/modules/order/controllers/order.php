<?php

class Order extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$this->template->load('index','index');
	}
	function all(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->required_fields('form_number','msr_client_id','batch_id','quantity','price');
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->set_relation('batch_id','batch','batch_readable_id'); 
		$crud->columns('form_number','msr_client_id','batch_id','quantity','price','discount');
		$crud->add_fields('form_number','msr_client_id','batch_id','quantity','price','discount');
		$crud->edit_fields('form_number','msr_client_id','batch_id','quantity','price','discount');
		$crud->callback_field('msr_client_id',array($this,'add_field_callback_1'));
		$crud->callback_column('msr_client_id',array($this,'_callback_msr_name'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function add_field_callback_1($value, $primary_key) {
	    $return_str =  '<select id="field-user" name="msr_client_id" size="8" class="chosen-multiple-select" data-placeholder="Select User" style="width:512px">';
	    $all = $this->user_model->get_all_msr_client();
	    foreach($all->result() as $row) {
	    	$return_str .= '<option value="'.$row->msr_client_id.'">'.get_name($row->msr_id).' -> '.get_name($row->client_id).'</option>';
    	}
	    return $return_str.'</select><div class="clear"></div>';
	}
	function _callback_msr_name($value, $row){
		return get_name($value);
	}
	function pending(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->unset_add(); 
		$crud->unset_edit(); 
		$crud->unset_delete(); 
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function cancelled(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->unset_add(); 
		$crud->unset_edit(); 
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function returned(){
		$crud = new grocery_CRUD();
		$crud->set_table('order'); 
		$crud->unset_add(); 
		$crud->unset_edit(); 
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function payment(){
		$crud = new grocery_CRUD();
		$crud->set_table('payment'); 
		$crud->set_relation('order_id','order','form_number'); 
		$crud->add_fields('amount','order_id','bank','check_number','check_full_amount','datetime');
		$crud->unset_edit(); 
		$crud->unset_delete();
		$crud->add_action('add Payment',base_url().'assets/images/money.png',base_url().'order/pay/');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>