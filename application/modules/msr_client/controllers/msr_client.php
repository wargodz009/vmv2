<?php

class Msr_client extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('msr_view'); 
		$crud->set_primary_key('user_id');
		$crud->display_as('first_name','Client');
		$crud->display_as('role_id','Role');
		$crud->display_as('district_id','District');
		$crud->field_type('user_id','invisible');
		$crud->field_type('first_name','invisible');
		$crud->field_type('middle_name','invisible');
		$crud->field_type('last_name','invisible');
		$crud->field_type('area','invisible');
		$crud->field_type('quota','invisible');
		$crud->field_type('Role','invisible');
		$crud->field_type('District','invisible');
		$crud->field_type('status','invisible');
		$crud->field_type('civil_status','invisible');
		$crud->callback_column('user',array($this,'_callback_get_username'));
		$crud->callback_edit_field('user',array($this,'edit_field_callback_1'));
		$crud->unset_delete(); 
		$crud->unset_add(); 
		$crud->set_relation('district_id', 'district', 'name');
		$crud->set_relation('role_id', 'role', 'name');
		$crud->set_relation_n_n('user', 'msr_client', 'user', 'msr_id', 'client_id', 'user_id',NULL,array('role_id'=>5));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	public function _callback_get_username($value, $row)
	{
		if(!empty($value)) {
			$user_id = explode(',', $value);
			$users = array();
			if(is_array($user_id)) {
				foreach ($user_id as $value) {
					$users[] = get_name($value);
				}
			} else {
				return get_name($value);
			}
			return implode('<br />',$users);
		}
	}
	function edit_field_callback_1($value, $primary_key)
	{
	    $return_str =  '<select id="field-user" name="user[]" multiple="multiple" size="8" class="chosen-multiple-select" data-placeholder="Select User" style="width:512px">';
	    $value = $this->user_model->get_all_clients();
	    foreach($value->result() as $row) {
	    	$return_str .= '<option value="'.$row->user_id.'" '.($this->user_model->is_owned($primary_key,$row->user_id) == true?'selected':'').'>'.get_name($row->user_id).'</option>';
    	}
	    return $return_str.'</select><div class="clear"></div>';
	}
}

?>
