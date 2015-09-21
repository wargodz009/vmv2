<?php

class Sales extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->model('batch/batch_model');
		$this->load->model('sales/sales_model');
	}
	function index($month = '00',$year ='00',$district = '00'){
		if($this->session->userdata('role_id') == 1) {
			$info = '';
			$new = $this->sales_model->get_new();
			if($new > 0) $info = 'You have <b><a href="'.base_url().'sales/for_approval">'.$new.'</a></b> new order(s) to approve.<br />';
			$done = $this->sales_model->get_done();
			if($done > 0 && $new > 0) {
				$info .= 'You have <b><a href="'.base_url().'sales/for_completion">'.$done.'</a></b> new order(s) to complete. ';
			} else {
				if($done > 0) {
					$info = 'You have <b><a href="'.base_url().'sales/for_completion">'.$done.'</a></b> new order(s) to complete. ';	
				}
			}
			if($info) {
				$this->session->set_userdata('info',$info);
			} 
		}
		$data['month'] = ($month != '00'?$month:date('m'));
		$data['year'] = ($year != '00'?$year:date('Y'));
		$data['district'] = ($district != ''?$district:'00');
		$data['area_list'] = $this->crud_model->read('district');
		$this->template->load('index','index',$data);
	}
	function create($get_what = '',$get_val = '') {
		if($get_what == 'client_info') {
			$get_client_id = $this->crud_model->read('msr_client',array(array('where','msr_client_id',$get_val)));
			$data = $this->crud_model->read('user',array(array('where','user_id',$get_client_id[0]->client_id)));
			echo json_encode($data[0]);exit;
		}
		if($get_what == 'product_info') {
			$item['items'] = $this->crud_model->read('item',array(array('where','item_id',$get_val)));
			$item['batches'] = $this->crud_model->read('batch',array(array('where','item_id',$get_val)));
			
			echo json_encode($item);exit;
		}
		if($get_what == 'area_clients') {
			$get_client_id = array();
			$get_area_msr = $this->crud_model->read('user',array(array('where','area',urldecode($get_val)),array('where','role_id',6)));
			if(!empty($get_area_msr)) {
				foreach($get_area_msr as $area_msr) {
					$msr_client_info = $this->crud_model->read('msr_client',array(array('where','msr_id',$area_msr->user_id)));
					if(!empty($msr_client_info)) {
						foreach($msr_client_info as $info) {
							$get_client_id[] = array(
								'id' => $info->msr_client_id,
								'msr_client_id' => get_name($info->msr_id),
								'client_id' => get_name($info->client_id)
							);
						}
					}
				}
				echo json_encode($get_client_id);exit;
			}
			return false;
		}
		$data['all_area'] = get_all_area();
		$data['msr_client'] = $this->crud_model->read('msr_client');
		$data['batch'] = $this->crud_model->read('batch');
		$data['items'] = $this->crud_model->read('item');
		$this->template->load('index','create',$data);
	}
	function for_approval(){
		if($this->session->userdata('role_id') == 1) {
			$crud = new grocery_CRUD();
			$crud->set_table('orders'); 
			$crud->unset_add();
			$crud->display_as('product_id','Product');
			$crud->display_as('msr_client_id','Area');
			$crud->fields('form_number','msr_client_id','discount','discount_type'); 
			$crud->columns('msr_client_id','discount','discount_type','form_number'); 
			$crud->set_relation('msr_client_id','msr_client','msr_id'); 
			$crud->callback_field('msr_client_id',array($this,'add_field_callback_1'));
			$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_area'));
			$crud->callback_after_insert(array($this, '_log_user_after_insert'));
			$crud->callback_after_update(array($this, '_log_user_after_update'));
			$crud->add_action('Set Returned', base_url().'assets/images/returned.png','','',array($this,'_callback_filter_order'));
			$crud->add_action('Cancel Order', base_url().'assets/images/cancel.png','','',array($this,'_callback_filter_cancel'));
			$crud->add_action('Print SO Form', base_url().'assets/images/print.png','','',array($this,'_callback_print_paid'));
			$crud->where('cancel_date',null);
			$crud->where('approved_pre',0);
			$crud->where('approved_post',0);
			if($this->session->userdata('role_id') == 1) {
				$crud->add_action('Approve Order', base_url().'assets/images/approve.gif','','',array($this,'_callback_filter_approve'));
				$crud->add_action('Set as Completed', base_url().'assets/images/complete.gif','','',array($this,'_callback_complete_order'));
			}
			$crud->order_by('approved_pre','asc');
			$crud->order_by('approved_post','asc');
			$output = $crud->render();
			$this->template->load('index','grocery_crud',$output);
		} else {
			$this->session->set_userdata('error','NO_PERMISSION');
			redirect('/');
		}
	}
	function for_completion(){
		if($this->session->userdata('role_id') == 1) {
			$crud = new grocery_CRUD();
			$crud->set_table('orders'); 
			$crud->unset_add();
			$crud->display_as('product_id','Product');
			$crud->display_as('msr_client_id','Area');
			$crud->fields('form_number','msr_client_id','discount','discount_type'); 
			$crud->columns('msr_client_id','discount','discount_type','form_number'); 
			$crud->set_relation('msr_client_id','msr_client','msr_id'); 
			$crud->callback_field('msr_client_id',array($this,'add_field_callback_1'));
			$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_area'));
			$crud->callback_after_insert(array($this, '_log_user_after_insert'));
			$crud->callback_after_update(array($this, '_log_user_after_update'));
			$crud->add_action('Set Returned', base_url().'assets/images/returned.png','','',array($this,'_callback_filter_order'));
			$crud->add_action('Cancel Order', base_url().'assets/images/cancel.png','','',array($this,'_callback_filter_cancel'));
			$crud->add_action('Print SO Form', base_url().'assets/images/print.png','','',array($this,'_callback_print_paid'));
			$crud->where('cancel_date',null);
			$crud->where('approved_pre',1);
			$crud->where('approved_post',0);
			if($this->session->userdata('role_id') == 1) {
				$crud->add_action('Approve Order', base_url().'assets/images/approve.gif','','',array($this,'_callback_filter_approve'));
				$crud->add_action('Set as Completed', base_url().'assets/images/complete.gif','','',array($this,'_callback_complete_order'));
			}
			$crud->order_by('approved_pre','asc');
			$crud->order_by('approved_post','asc');
			$output = $crud->render();
			$this->template->load('index','grocery_crud',$output);
		} else {
			$this->session->set_userdata('error','NO_PERMISSION');
			redirect('/');
		}
	}
	function all(){
		if($this->session->userdata('role_id') == 1) {
			$info = '';
			$new = $this->sales_model->get_new();
			if($new > 0) $info = 'You have <b><a href="'.base_url().'sales/for_approval">'.$new.'</a></b> new order(s) to approve.<br />';
			$done = $this->sales_model->get_done();
			if($done > 0 && $new > 0) {
				$info .= 'You have <b><a href="'.base_url().'sales/for_completion">'.$done.'</a></b> new order(s) to complete. ';
			} else {
				if($done > 0) {
					$info = 'You have <b><a href="'.base_url().'sales/for_completion">'.$done.'</a></b> new order(s) to complete. ';	
				}
			}
			if($info) {
				$this->session->set_userdata('info',$info);
			} 
		}
		$crud = new grocery_CRUD();
		$crud->set_table('orders'); 
		$crud->unset_add();
		$crud->display_as('si_no','DR/SI #'); 
		$crud->display_as('sales_type','CLient\'s Name'); 
		$crud->display_as('discount_type','%'); 
		$crud->display_as('msr_client_id','Area');
		$crud->display_as('product_id','Product');
		$crud->fields('form_number','msr_client_id','discount','discount_type','subtotal','vat_sales','vat_12','total_amount'); 
		//$crud->columns('msr_client_id','discount','discount_type','form_number'); 
		$crud->columns('order_date','msr_client_id','sales_type','si_no','product_id','batch','expiry','quantity','free_goods','price','discount_type','total_amount');
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_area'));
		$crud->callback_column('sales_type',array($this,'_callback_msr_client_name'));
		$crud->callback_column('order_date',array($this,'_callback_order_date'));
		$crud->callback_column('batch',array($this,'_callback_batch'));
		$crud->callback_column('expiry',array($this,'_callback_expiry'));
		$crud->callback_column('product_id',array($this,'_callback_product_id'));
		$crud->callback_column('discount_type',array($this,'_callback_discount_amount'));
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->callback_field('msr_client_id',array($this,'add_field_callback_1'));
		$crud->callback_column('form_number',array($this,'_callback_form_number'));
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_area'));
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		//$crud->add_action('Set Returned', base_url().'assets/images/returned.png','','',array($this,'_callback_filter_order'));
		$crud->add_action('Cancel Order', base_url().'assets/images/cancel.png','','',array($this,'_callback_filter_cancel'));
		$crud->add_action('Print SO Form', base_url().'assets/images/print.png','','',array($this,'_callback_print_paid'));
		if($this->session->userdata('role_id') == 1) {
			$crud->add_action('Approve Order', base_url().'assets/images/approve.gif','','',array($this,'_callback_filter_approve'));
			$crud->add_action('Set as Completed', base_url().'assets/images/complete.gif','','',array($this,'_callback_complete_order'));
		}
		$crud->order_by('approved_pre','asc');
		$crud->order_by('approved_post','asc');
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function dashboard($grocery_crud = 'grocery_crud'){
		$crud = new grocery_CRUD();
		$crud->set_table('orders'); 
		$crud->set_theme('flexigrid_mini'); 
		$crud->set_subject('SALES'); 
		$crud->display_as('order_date','Order'); 
		$crud->display_as('product_id','Products'); 
		$crud->display_as('msr_client_id','Area'); 
		$crud->display_as('quantity','QTY'); 
		$crud->display_as('free_goods','FG'); 
		$crud->display_as('total_amount','AMOUNT'); 
		$crud->display_as('si_no','DR/SI #'); 
		$crud->display_as('sales_type','Client\'s Name'); 
		$crud->display_as('discount_type','%'); 
		$crud->display_as('product_id','Product');
		$crud->unset_operations();
		$crud->fields('form_number','msr_client_id','discount','discount_type'); 
		$crud->columns('order_date','msr_client_id','sales_type','si_no','product_id','batch','expiry','quantity','free_goods','price','discount_type','total_amount');
		//$crud->columns('msr_client_id','discount','discount_type','form_number'); 
		$crud->callback_column(unique_field_name('msr_client_id'),array($this,'_callback_msr_area'));
		$crud->callback_column('sales_type',array($this,'_callback_msr_client_name'));
		$crud->callback_column('order_date',array($this,'_callback_order_date'));
		$crud->callback_column('batch',array($this,'_callback_batch'));
		$crud->callback_column('expiry',array($this,'_callback_expiry'));
		$crud->callback_column('product_id',array($this,'_callback_product_id'));
		$crud->callback_column('discount_type',array($this,'_callback_discount_amount'));
		$crud->set_relation('msr_client_id','msr_client','msr_id'); 
		$crud->order_by('order_date','desc');
		$output = $crud->render();
		$this->load->view($grocery_crud,$output);
	}
	function dashboard_advance($month = '00',$year ='00',$district = '00'){
		$data['sales'] = $this->user_model->get_all_msr();
		$this->load->view('dashboard_advance',$data);

	}
	function get_sales($msr_id,$month,$year){
		$all_msr_ids = $this->crud_model->read('msr_client',array(array('where','msr_id',$msr_id)));
		//all orders	
		if(!empty($all_msr_ids)) {
			$ids = array();
			foreach ($all_msr_ids as $key) {
				$ids[] = $key->msr_client_id;
			}
			$orders = $this->sales_model->get_sales($ids,$month,$year);
			//orders
			if(!empty($orders)) {
				$total = 0;
				foreach ($orders as $order) {
					$total += $order->total_amount;
				}
				return $total;
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}
	function all_sales($msr_id){
		$data['msr_id'] = $msr_id;
		$data['orders'] = array();
		$all_msr_ids = $this->crud_model->read('msr_client',array(array('where','msr_id',$msr_id)));
		//all orders	
		if(!empty($all_msr_ids)) {
			$ids = array();
			foreach ($all_msr_ids as $key) {
				$ids[] = $key->msr_client_id;
			}
			$orders = $this->sales_model->get_sales($ids);
			//orders
			if(!empty($orders)) {
				$data['orders'] =  $orders;
			}
		}
		$data['msr_name'] = get_name($msr_id); 
		$data['msr_district'] = get_district_name(get_district_id($msr_id)); 
		$this->template->load('index','sales_history_per_person',$data);
	}
	function area($district_id){
		$data['district_id'] = $district_id;
		$data['orders'] = array();
		$all_msr_ids = array();
		$msrs = $this->crud_model->read('user',array(array('where','district_id',$district_id),array('where','role_id',6)));
		if(!empty($msrs)) {
			foreach($msrs as $msr) {
				$id = $this->crud_model->read('msr_client',array(array('where','msr_id',$msr->user_id)));
				if(!empty($id)) {
					$all_msr_ids = $id;
				}
			}
		}
		//all orders	
		if(!empty($all_msr_ids)) {
			$ids = array();
			foreach ($all_msr_ids as $key) {
				$ids[] = $key->msr_client_id;
			}
			$orders = $this->sales_model->get_sales($ids);
			//orders
			if(!empty($orders)) {
				$data['orders'] =  $orders;
			}
		}
		$data['area'] = get_district_name($district_id); 
		$this->template->load('index','sales_history_per_area',$data);
	}
	function _callback_print_paid($primary_key,$row){
		$items = $this->crud_model->read('orders',array(array('where','order_id',$row->order_id),array('where','approved_post',1)));
		if($items) {
			return base_url().'collection/reciept/'.$row->order_id.'/'.$primary_key;
		} else {
			return '#';
		}
	}
	function _callback_filter_approve($primary_key,$row){
		if($row->cancel_date == null) {
			if($row->approved_pre == 0 && $row->approved_post == 0 ) {
				return base_url().'sales/set_approved/'.$primary_key;
			}
		}
		return '#';
	}
	function _callback_complete_order($primary_key,$row){
		if($row->cancel_date == null) {
			if($row->approved_pre != 0 && $row->approved_post == 0) {
				if($this->crud_model->read('payment_orders',array(array('where','orderid',$row->order_id)))) {

				}
				return base_url().'sales/set_complete/'.$primary_key;
			}
		}
		return '#';
	}
	function _callback_filter_cancel($primary_key,$row){
		if($row->approved_pre == 0 && $row->approved_post == 0) {
			if($row->cancel_date != null) {
				return '#';
			} else {
				return base_url().'sales/set_cancelled/'.$primary_key;
			}
		} 
		return '#';
	}
	function _callback_filter_order($primary_key,$row){
		if($row->approved_pre != 0 && $row->approved_post != 0) {
			if($row->return_id == 0) {
				return base_url().'sales/set_returned/'.$primary_key;
			} else {
				return '#';
			}
		} 
		return '#';
	}
	function _log_user_after_insert($post_array,$primary_key){
		logs('add_order','success',$primary_key);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_order','success',$primary_key);
	}
	function _log_user_after_insert2($post_array,$primary_key){
		logs('add_order_details','success',$primary_key);
	}
	function _log_user_after_update2($post_array,$primary_key){
		logs('edit_order_details','success',$primary_key);
	}
	function item($order_id = ''){
		if($order_id == '') {
			$crud = new grocery_CRUD();
			$crud->set_table('order_item'); 
			$crud->unset_add();
			$crud->set_relation('order_id','orders','form_number'); 
			$crud->set_relation('batch_id','batch','batch_readable_id'); 
			$crud->callback_after_insert(array($this, '_log_user_after_insert2'));
			$crud->callback_after_update(array($this, '_log_user_after_update2'));
			$output = $crud->render();
			$this->template->load('index','grocery_crud',$output);
		} else {
			$data['order_info'] = $this->crud_model->read('orders',array(array('where','order_id',$order_id)));
			$data['paid_items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id),array('where','add_type','paid')));
			$data['free_items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id),array('where','add_type','free')));
			$this->template->load('index','show_items',$data);
		}
	}
	function add_field_callback_1($value, $primary_key) {
	    $return_str =  '<select id="field-user" name="msr_client_id" size="8" class="chosen-multiple-select" data-placeholder="Select User" style="width:512px">';
	    $all = $this->user_model->get_all_msr_client();
	    foreach($all->result() as $row) {
	    	$return_str .= '<option value="'.$row->msr_client_id.'" '.($value==$row->msr_client_id?'Selected=true':'').'>'.get_name($row->msr_id).' -> '.get_name($row->client_id).'</option>';
    	}
	    return $return_str.'</select><div class="clear"></div>';
	}
	function _callback_msr_area($value, $row){
		return get_area($value);
	}
	function _callback_discount_amount($value, $row){
		//return (($value == 'percentage')?$row->discount_amount:'0');
		if($value == 'percentage') {
			return isset($row->discount_amount)?$row->discount_amount. '%':0 . '%';
		} else {
			if(isset($row->discount_amount)) {
				return '-'. $row->discount_amount;
			}
		}
	}
	function _callback_msr_client_name($value, $row){
		return get_name(get_msr_client($row->msr_client_id,'client_id'));
	}
	function _callback_batch($value, $row){
		return get_batch_info($row->product_batch,'batch_readable_id');
	}
	function _callback_expiry($value, $row){
		return pretty_date(get_batch_info($row->product_batch,'expire_date'));
	}
	function _callback_product_id($value, $row){
		return get_item_name($value);
	}
	function _callback_order_date($value, $row){
		return pretty_date($value);
	}
	function _callback_form_number($value, $row){
		return '<a target="_new" href="'.base_url().'sales/item/'.$row->order_id.'">'.$value.'</a>';
	}
	function set_returned($order_id) {
		if($this->input->post('submit') != '') {
			$update['return_id'] = 1;
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$items = $this->input->post('items');
			if(!empty($items)) {
				foreach ($items as $item) {
					$data = array(
						'order_item_id'=>$item['order_item_id'],
						'quantity'=>$item['quantity'],
						'reason'=>$item['reason']
					);
					$this->sales_model->add_return($data);
					$this->batch_model->increment_return($item['batch_id'],$item['quantity']);
				}
			}
			$this->session->set_flashdata('success','Order Returned!');
			redirect('sales/all');
		} else {
			$data['order_id'] = $order_id;
			if($this->crud_model->valid('orders','order_id',$order_id)) {
				$data['order_details'] = $this->crud_model->read('orders',array(array('where','order_id',$order_id)));
				$data['items'] = $this->crud_model->read('order_item',array(array('where','order_id',$order_id)));
				$this->template->load('index','order_return_form',$data);
			} else {
				$this->session->set_flashdata('danger','not a valid order!');
				redirect('/');
			}
		}
	}
	function set_cancelled($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('orders','order_id',$order_id)) {
			$update['cancel_date'] = date('Y-m-d');
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$this->session->set_flashdata('success','Order Cancelled!');
			redirect('sales/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
	function set_approved($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('orders','order_id',$order_id)) {
			$update['approved_pre'] = 1;
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$order_details = $this->crud_model->read('orders',array(array('where','order_id',$order_id)));
			$this->session->set_flashdata('success','Order Approved!');
			redirect('sales/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
	function set_complete($order_id) {
		$data['order_id'] = $order_id;
		if($this->crud_model->valid('orders','order_id',$order_id)) {
			$update['approved_post'] = 1;
			$this->crud_model->update('orders',$update,array(array('where','order_id',$order_id)));
			$order_details = $this->crud_model->read('order_item',array(array('where','order_id',$order_id)));
			if(!empty($order_details)) {
				foreach($order_details as $order) {
					$this->batch_model->increment($order->batch_id,$order->quantity);
				}
			}
			$this->session->set_flashdata('success','Order Completed!');
			redirect('sales/all');
		} else {
			$this->session->set_flashdata('danger','not a valid order!');
			redirect('/');
		}
	}
	function save(){
		$this->db->insert('orders',$this->input->post());
		$id = $this->db->insert_id();
		if($id) {
			if($this->input->post('sales_type') == 1) {
				$add_type = 'paid';
			} else {
				$add_type = 'free';
			}
			$data = array(
				'batch_id'=>$this->input->post('product_batch'),
				'order_id'=>$id,
				'quantity'=>$this->input->post('quantity'),
				'custom_price'=>$this->input->post('price'),
				'add_type'=>$add_type
			);
			$this->db->insert('order_item',$data);
		}
		$this->session->set_flashdata('success','Order Added!');
		redirect('sales');
	}
}

?>