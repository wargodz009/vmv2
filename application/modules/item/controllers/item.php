<?php

class Item extends MX_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
	}
	function index(){
		$crud = new grocery_CRUD();
		$crud->set_table('item'); 
		$crud->callback_column('name',array($this,'_callback_to_link'));
		$crud->set_relation('item_type_id','item_type','{name}');

		$crud->add_fields('name','item_type_id','generic_name','description');
		$crud->edit_fields('name','item_type_id','generic_name','description','status');
		
		$crud->columns('name','generic_name','item_type_id','description','status');
		
		$crud->display_as('name','Product Name');
		$crud->display_as('item_type_id','Type');
		
		if(get_role() != 'administrator') {
			$crud->unset_delete();
		}
		
		$crud->required_fields('name','item_type_id','generic_name','description');
		$crud->callback_column('name',array($this,'_callback_to_link'));
		$crud->callback_after_insert(array($this, '_log_user_after_insert'));
		$crud->callback_after_update(array($this, '_log_user_after_update'));
		$crud->callback_after_delete(array($this, '_log_user_after_delete'));
		$output = $crud->render();
		$this->template->load('index','grocery_crud',$output);
	}
	function _log_user_after_insert($post_array,$primary_key){
		logs('add_item','success',$primary_key);
	}
	function _log_user_after_update($post_array,$primary_key){
		logs('edit_item','success',$primary_key);
	}
	function _log_user_after_delete($post_array,$primary_key){
		logs('delete_item','success',$primary_key);
	}
	function _callback_to_link($value, $row){
		return '<a href="'.base_url().'item/history/'.$row->item_id.'">'.$value.'</a>';
	}
	function dashboard(){
		$crud = new grocery_CRUD();
		$crud->set_table('item'); 
		$crud->set_subject('ITEMS'); 
		$crud->unset_operations();
		$crud->columns('name','item_type_id','generic_name','description'); 
		$crud->set_relation('item_type_id','item_type','name'); 
		$output = $crud->render();
		$this->load->view('grocery_crud',$output);
	}
	function history($item_id){
		$history['info'] = get_item_name($item_id);
		$history['data'] = array();
		if(! is_valid_item($item_id)) {
			$history['data'] = 'Ivalid ITEM';
		} else {
			//get all batches
			$history['batches'] = $this->crud_model->read('batch',array(array('where','item_id',$item_id)));
			if(!empty($history['batches'])) {
				foreach($history['batches'] as $batch) {
					$history['batch_ids'][] = $batch->batch_id;
					$history['orders'][] = array(
						'type'=>get_supplier_name($batch->supplier_id,"name"),
						'ref'=>'',
						'batch'=>$batch->batch_readable_id,
						'date'=>pretty_date($batch->recieve_date),
						'transtype'=>'in',
						'qty'=>$batch->count,
						'inventory_count'=>$batch->count
					);
					//get all order items
					$items = $this->crud_model->read('order_item',array(array('where','batch_id',$batch->batch_id)));
					if(!empty($items)) {
						foreach($items as $item) {
							$history['orders'][] = array(
								'type'=>get_name(get_id_from_msr_id($this->crud_model->read('orders',array(array('where','order_id',$item->order_id)),'msr_client_id'))),
								'ref'=>$this->crud_model->read('orders',array(array('where','order_id',$item->order_id)),'form_number'),
								'batch'=>$batch->batch_readable_id,
								'date'=>pretty_date($this->crud_model->read('orders',array(array('where','order_id',$item->order_id)),'order_date')),
								'transtype'=>'out',
								'qty'=>$item->quantity,
								'inventory_count'=>$batch->count - $item->quantity
							);
						}
					}
				}
			}
		}
		$this->template->load('index','list_item_history',$history);
	}
}

?>