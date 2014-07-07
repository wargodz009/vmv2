<?php

class Site extends MX_Controller{
	
	function __construct(){
		parent::__construct();
	}
	function index() {
		$this->template->load('index','dashboard/dashboard_'.$this->session->userdata('role_id'));
	}
	function not_found() {
		$this->template->load('index','custom_404');
	}
	function login() {
		$this->load->model('user/user_model');
		if($this->input->post('user_email') != '') {
			if($this->user_model->validate_user($this->input->post('user_email'),$this->input->post('password')) == true) {
				$user_info = $this->user_model->validate_user($this->input->post('user_email'),$this->input->post('password'),TRUE);
				$data[] = array('where','role_id',$user_info->role_id);
				$newdata = array(
					'username'=>$user_info->email,
					'user_id'=>$user_info->user_id,
					'role_id'=>$user_info->role_id,
					'role_name'=>$this->crud_model->read('role',$data,'name')
				);
				$this->session->set_flashdata('success', 'Welcome '.$newdata['username'].'!');
				$this->session->set_userdata($newdata);
				logs('login','success','login_form');
				redirect();
			} else {
				logs('login','fail','login_form');
				$this->session->set_flashdata('danger', 'Invalid Username/Password!');
				redirect('signin');
			}
		} else {
			$this->template->load('index','signin');
		}
	}
	function signout(){
		logs('logout','success','logout_form');
		$this->session->sess_destroy();
		$this->session->set_flashdata('danger', 'Signed out!');
		redirect();
	}
}

?>