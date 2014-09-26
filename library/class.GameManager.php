<?php


class GameManager extends AbstractGenericManager
{
	function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/game.xml');
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
	
	function allGameUsers($idGame){
		$query = $this->_xml->allGameUser;
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByGame;
		$parameters['id_game'] = $idGame;
		return self::query($query,$parameters);
	}
	
	
	
}