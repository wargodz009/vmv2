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
			if($this->user_model->validate_user($this->input->post('user_email'),$this->input->post('password'))) {
				$user_info = $this->user_model->validate_user($this->input->post('user_email'),$this->input->post('password'),TRUE);
				$newdata = array(
					'username'=>$user_info->email,
					'user_id'=>$user_info->user_id,
					'role_id'=>$user_info->role_id
				);
				$this->session->set_userdata($newdata);
				redirect();
			} else {
				$data['error'] = 'Invalid Username/Password!';
				$this->template->load('index','signin',$data);
			}
		} else {
			$this->template->load('index','signin');
		}
	}
	function signout(){
		$this->session->sess_destroy();
		$this->session->set_flashdata('error', 'Signed out!');
		redirect();
	}
}

?>