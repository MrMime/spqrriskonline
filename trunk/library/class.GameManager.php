<?php


class GameManager 
{
	protected $_xml 	= null;
	protected $_result 	= null;
	protected $_db		= null;
	
	function __construct(){
		global $db;
		$this->_xml = simplexml_load_file('./db/game.xml');
		$this->_db = $db;
	}
	
	function currentGamePhase($idGame){
		$query = trim($this->_xml->currentGamePhase);
		$parameters = array('id_game'=>1);
		$this->_result = $this->_db->query($query,$parameters);
		return $this->_result;
	}
	
	function currentGameUserPhase($idGame){
		$query = trim($this->_xml->currentGameUserPhase);
		$parameters = array('id_game'=>1);
		$this->_result = $this->_db->query($query,$parameters);
		return $this->_result;
	}
	
	function currentGamePhaseUser($idGame){
		
	}
	
	
}