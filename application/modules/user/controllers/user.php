<?php

class User extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('user'); 
		$crud->display_as('district_id','District');
		$crud->display_as('role_id','Role');
		$crud->set_relation('district_id','district','name');
		$crud->set_relation('role_id','role','name');
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function employee(){
		$crud = new grocery_CRUD();
		$crud->set_table('user'); 
		$crud->where('user.role_id !=','5'); 
		$crud->where('user.role_id !=','1'); 
		$crud->display_as('district_id','District');
		$crud->display_as('role_id','Role');
		$crud->set_relation('district_id','district','name');
		$crud->set_relation('role_id','role','name');
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function client(){
		$crud = new grocery_CRUD();
		$crud->set_table('user'); 
		$crud->where('user.role_id','5'); 
		$crud->display_as('district_id','District');
		$crud->display_as('role_id','Role');
		$crud->set_relation('district_id','district','name');
		$crud->set_relation('role_id','role','name');
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	protected function _unique_join_name($field_name) {
		return 'j'.substr(md5($field_name),0,8); 
    }
}

?>