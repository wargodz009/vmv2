<?php

class Area extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('area'); 
		$crud->unset_read();
		$crud->display_as('district_id','District'); 
		$crud->set_relation('district_id','district','name'); 		
		$crud->add_fields('area_name','area_code','district_id');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
		
	}
	function getArea(){
		$area = $this->crud_model->read('area');
		echo json_encode($area);
	}
	function getAreaById($id){
		$area = $this->crud_model->read('area',array(array('where','area_id',$id)));
		echo json_encode($area);
	}
}

?>