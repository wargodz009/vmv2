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
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->callback_after_delete(array($this, '_log_user_after_delete'));
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
		$crud->required_fields('first_name','email','password','area','role_id','district_id');
		$crud->columns('first_name','middle_name','last_name','email','password','area','role_id','district_id','quota');
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$crud->add_fields('first_name','middle_name','last_name','email','password','area','role_id','district_id','quota');
		$crud->edit_fields('first_name','middle_name','last_name','email','password','area','role_id','district_id','quota','status');
		$crud->callback_column('quota',array($this,'_callback_to_number'));
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->callback_after_delete(array($this, '_log_user_after_delete'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _log_user_after_insert($post_array,$primary_key){
		logs('add_user','success',$primary_key);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_user','success',$primary_key);
	}
	function _log_user_after_delete($post_array,$primary_key){
		logs('delete_user','success',$primary_key);
	}
	function _callback_to_number($value, $row){
		return number_format($value);
	}
	function client(){
		$crud = new grocery_CRUD();
		$crud->set_table('user'); 
		$crud->where('user.role_id','5'); 
		$crud->display_as('district_id','District');
		$crud->display_as('first_name','Name/Hospital');
		$crud->columns('first_name','middle_name','last_name','address','district_id','contact_person','contact_number','area','note');
		$crud->add_fields('first_name','middle_name','last_name','email','address','area','contact_person','contact_number','quota','role_id','district_id');
		$crud->edit_fields('first_name','middle_name','last_name','email','address','area','quota','contact_person','contact_number','role_id','district_id','note');
		$crud->required_fields('first_name','email','password','area','role_id','address','district_id');
		$crud->set_relation('district_id','district','name');
		$crud->set_relation('role_id','role','name');
		$crud->required_fields('first_name','email','role_id','district_id','address');
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->callback_after_delete(array($this, '_log_user_after_delete'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
}

?>