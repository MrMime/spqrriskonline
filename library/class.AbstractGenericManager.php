<?php


Abstract class AbstractGenericManager
{
	protected $_xml 	= null;
	protected $_result 	= null;
	protected $_db		= null;
	
	public function __construct(){
		global $db;
		$this->_db = $db;
	}
	
	
}