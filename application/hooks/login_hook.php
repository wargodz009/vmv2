<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

class login_hook  {
	function is_logged_in() {
		$LH =& get_instance();
		if (ENVIRONMENT == 'development') {
			$LH->output->enable_profiler(TRUE);
		}
		$module = ($LH->uri->segment(1)?$LH->uri->segment(1):'site');
		$function = ($LH->uri->segment(2)?$LH->uri->segment(2):'index');
		$word_list = array('login','signin','logout','signout','not_found');
		//if not login, signin, logout or signout
		if(!in_array($LH->uri->segment(1),$word_list) && !in_array($LH->uri->segment(2),$word_list)) {
			//if site is open
			if($this->is_site_open() == true) {
				//if user is logged in
				if(! $LH->session->userdata('user_id') == '') {
					if(! $LH->permission_model->check($LH->session->userdata('role_id'),$module,$LH->uri->segment(2))) {
						$LH->session->set_flashdata('danger','user has no permission to view this content!');
						redirect('/');
					}
				} else {
					redirect('signin');
				}
			} else {
				if($LH->session->userdata('role_id') != 1) { 
					$LH->session->sess_destroy();
					$LH->session->sess_create(); 
					$LH->session->set_flashdata('danger','Site is already Closed! **Only ADMIN account can ENTER while Site is Closed for use**');
					redirect('signin');
				}
			}
		}
		return true;
	}
	function is_site_open() {
		$LH =& get_instance();
		$time = strtotime('now');
		$day = strtolower(date('D'));
		$from = strtotime($LH->setting_model->get_setting('site_open_time'));
		$to = strtotime($LH->setting_model->get_setting('site_close_time'));
		$operation_days = $LH->setting_model->get_setting('site_open_day');
		if ($time > $from && $time < $to ) {
			if (strpos($operation_days,$day) !== false) {
				return true;
			}
		}
		return false;
	}
}

?>