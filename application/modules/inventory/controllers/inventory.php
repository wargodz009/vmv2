<?php

class Inventory extends MX_Controller{
	
	function __construct(){
		parent::__construct();
	}
	function index() {
		$this->template->load('index','index');
	}
}

?>