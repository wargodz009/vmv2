<?php

class Ar extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('ar_old'); 
		$crud->required_fields('dr_date','dr_num','client_id','amount');
		$crud->set_relation('client_id','user','{last_name} {first_name}');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
		
	}
}

?>