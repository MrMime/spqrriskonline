<?php


Abstract class AbstractGenericManager
{
	protected $_xml 	= null;
	protected $_commonXml = null;
	protected $_result 	= null;
	protected $_db		= null;
	
	protected $_gameManager = null;
	protected $_locationManager = null;
	
	public function __construct(){
		global $db, $gameManager,$locationManager;
		$this->_db = $db;
		$this->_commonXml = simplexml_load_file('./db/common.xml');
		$this->_gameManager = $gameManager;
		$this->_locationManager = $locationManager;
	}
	
	protected function query($query,$parameters){
		$query = str_replace("\n\n","\n",$query);
		$query = trim($query);
		return $this->_db->query($query,$parameters);
	}
	
}