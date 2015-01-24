<?php
/**
 * CRUD Model
 * @author		Joshua Kendall <josh@doesthismakesense.org>
 * @package		Models
 * @date		01/10/2009
 * @revision		3
 * @access		public
 * @desc		CRUD Model for CI sites
 * @doc			http://doesthismakesense.org/projects/crud/
 */
class crud_model extends CI_Model
{ 

	/**
	 * Constructor Method
	 *
	 */
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Create
	 * @param $table
	 * @param $data
	 * @param $sql_modifiers
	 * @return
	 */
	public function create($table, $data = array(), $sql_modifiers = array())
	{
		foreach($sql_modifiers as $modifier)
		{
			if(!isset($modifier[2]))
			{
				$this->db->$modifier[0]($modifier[1]);
			} else {
				if(!isset($modifier[3]))
				{
					$this->db->$modifier[0]($modifier[1], $modifier[2]);
				} else {
					$this->db->$modifier[0]($modifier[1], $modifier[2], $modifier[3]);
				}
			}
		}
		$query = $this->db->insert($table, $data);
		return;
	}

	/**
	 * Read
	 * @param $table
	 * @param $sql_modifiers
	 * @return Object
	 * $sql_modifiers: array(array('where','item_id',$item_id),array('where','item_id',$item_id),...)
	 */
	public function read($table, $sql_modifiers = array(),$name = false)
	{
		foreach($sql_modifiers as $modifier)
		{
			if(!isset($modifier[2]))
			{
				$this->db->$modifier[0]($modifier[1]);
			} else {
				if(!isset($modifier[3]))
				{
					$this->db->$modifier[0]($modifier[1], $modifier[2]);
				} else {
					$this->db->$modifier[0]($modifier[1], $modifier[2], $modifier[3]);
				}
			}
		}
		$query = $this->db->get($table);
		if($name != false) {
			return @$query->row()->$name;
		} else {
			return $query->result();
		}
	}

	/**
	 * Update
	 * @param $table
	 * @param $data
	 * @param $sql_modifiers
	 * @return
	 */
	public function update($table, $data = array(), $sql_modifiers = array())
	{
		foreach($sql_modifiers as $modifier)
		{
			if(!isset($modifier[2]))
			{
				$this->db->$modifier[0]($modifier[1]);
			} else {
				if(!isset($modifier[3]))
				{
					$this->db->$modifier[0]($modifier[1], $modifier[2]);
				} else {
					$this->db->$modifier[0]($modifier[1], $modifier[2], $modifier[3]);
				}
			}
		}
		$query = $this->db->update($table, $data);
	}

	/**
	 * Delete
	 * @param $table
	 * @param $params
	 * @param $sql_modifiers
	 * @return
	 */
	public function delete($table, $sql_modifiers = array())
	{
		foreach($sql_modifiers as $modifier)
		{
			if(!isset($modifier[2]))
			{
				$this->db->$modifier[0]($modifier[1]);
			} else {
				if(!isset($modifier[3]))
				{
					$this->db->$modifier[0]($modifier[1], $modifier[2]);
				} else {
					$this->db->$modifier[0]($modifier[1], $modifier[2], $modifier[3]);
				}
			}
		}
		$query = $this->db->delete($table);
	}

	/**
	 * Execute SQL File
	 * @param $file_name
	 * @return
	 */
	public function execute_sql_file($file_name)
	{
		$file = file($file_name);
		foreach($file as $query)
		{
			$result = $this->db->query($query);
		}
		return;
	}
	public function valid($table='',$field = '',$value)
	{
		$this->db->where($field,$value);
		$Q = $this->db->get($table);
		if($Q->num_rows()>0) {
			return true;
		} else {
			return false;
		}
	}

}