<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Menu extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->model("menu_model");
		$this->load->model("user_model");
	}
	function index(){
		if($this->session->userdata('role_id') != '') {
			if($this->menu_model->is_menu_item($this->uri->segment(1))) {
				$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
			} else {
				$module = $this->menu_model->get_parent($this->uri->segment(1));
				$function = 'index';
				$data['current'] = $module.'/'.$function;
			}
			$data['items'] = $this->menu_model->get_menu($this->session->userdata('role_id'));	
		} else {
			$data['items'] = $this->menu_model->menu_logged_out();	
		}
		$data['currentuser'] = $this->user_model->get_current_user();	
		$this->load->view("menu", $data);
	}
	function sub_menu(){
		if($this->session->userdata('role_id') != '') {
		$data['current'] = $this->uri->segment(1).'/'.$this->uri->segment(2);
			if(! $this->menu_model->is_menu_item($this->uri->segment(1))) {
				$module = $this->menu_model->get_parent($this->uri->segment(1));
				$function = '';
			} else {
				$module = $this->uri->segment(1);
				$function = $this->uri->segment(2);
			}
			$param[0] = array('where','module',$module);
			$param[1] = array('where','show_on_menu',1);
			$param[2] = array('where','function',($function?$function:'index'));
			$data['items'] = $this->menu_model->get_sub_menu($this->session->userdata('role_id'),$this->crud_model->read('action',$param,'action_id'));	
		} else {
			$data['items'] = $this->menu_model->menu_logged_out();	
		}
		$this->load->view("sub_menu", $data);
		
	}
}

?>