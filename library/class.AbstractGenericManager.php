<?php

Abstract class AbstractGenericManager
{
	protected $_xml 	= null;
	protected $_commonXml = null;
	protected $_result 	= null;
	protected $_db		= null;
	protected $_language = null;
	
	public function __construct(){
		global $db;
		$this->_db = $db;
		$this->_commonXml = simplexml_load_file('./db/common.xml');
		$this->_language = $GLOBALS['language'][$_SESSION['lang']];
	}
	
	protected function query($query,$parameters){
		$query = str_replace("\n\n","\n",$query);
		$query = trim($query);
		return $this->_db->query($query,$parameters);
	}
	
	protected function __orNull($data,$label){
		return !isset($data[$label]) ? null : $data[$label];
	}	
	
	public function getLogManager(){
		return $_SESSION['logManager'];
	}
}