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
		$crud->display_as('first_name','MSR');
		$crud->display_as('role_id','Role');
		$crud->display_as('district_id','District');
		$crud->field_type('civil_status','invisible');
		$crud->columns('first_name','role_id','district_id','email','area','quota','district_id','user');
		$crud->edit_fields('district_id','user');
		$crud->callback_column('user',array($this,'_callback_get_username'));
		$crud->callback_column('quota',array($this,'_callback_to_number'));
		$crud->callback_edit_field('user',array($this,'edit_field_callback_1'));
		$crud->unset_delete(); 
		$crud->unset_add(); 
		$crud->set_relation('district_id', 'district', 'name');
		$crud->set_relation('role_id', 'role', 'name');
		$crud->set_relation_n_n('user', 'msr_client', 'user', 'msr_id', 'client_id', 'user_id',NULL,array('role_id'=>5));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_msrclient','success',$primary_key);
	}
	function _callback_to_number($value, $row){
		return number_format($value);
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
