<?php

class Setting extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('setting'); 
		$crud->unset_delete();
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function logs(){
		$crud = new grocery_CRUD();
		$crud->set_table('logs'); 
		$crud->unset_delete();
		$crud->unset_add();
		$crud->unset_edit();
		$crud->order_by('datetime','desc');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function maintenance($do = ''){
		if($do == 'migrate') {
				$data = array(
			   'name' => 'critical_expire',
			   'readable_name' => 'Near Expire',
			   'value' => '36',
			   'default_value' => '6',
			   'type' => 'text'
			);
			$res = $this->db->insert('setting', $data); 
			if($res){
				echo 'setting added!<br />';
			}
		} else {
			$this->template->load('index','maintenance_page');
		}
	}
	function backup(){
		if($this->session->userdata('role_id') == 1) {
			$this->load->dbutil();
			$backup =& $this->dbutil->backup();

			$this->load->helper('download');
			force_download('mybackup.gz', $backup);
		} else {
			show_404();
		}
	}
	function reset(){
		if($this->session->userdata('role_id') == 1) {
			$this->db->query('SET FOREIGN_KEY_CHECKS=0');
			$tables = array(
				'batch',
				'crud',
				'item',
				'msr_client',
				'orders',
				'order_item',
				'order_return',
				'payment',
				'payment_item',
				'supplier',
				'logs',
			);
			foreach ($tables as $key) {
				$this->db->truncate($key);
			}
			$this->db->query('SET FOREIGN_KEY_CHECKS=1');
			$this->db->where('role_id',5);
			$this->db->delete('user');
			$this->db->where('role_id',6);
			$this->db->delete('user');
			$this->session->set_flashdata('success','Database Emptied!');
			redirect('setting/maintenance');
		} else {
			show_404();
		}
	}
	function migrate(){
		$data = array();
		if(isset($_POST['submit']) && !empty($_POST['migrate'])) {
			$res = $this->db->query($_POST['migrate']);
			var_dump($res);
		}
		$this->load->view('migrate_form',$data);
	}
}

?>