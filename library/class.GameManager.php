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
	
	
	
	function countIniRoundUserPoint($idGame,$idUser){
		$points = 0;
		//check if the user is the user with most sea territory
		$idUserMostNaval = $this->_locationManager->userWithMostSeaTerritory($idGame);
		if ($idUser == $idUserMostNaval){
			$points++;
		}
		
		//check how many coliseum has the user
		$coliseum = $this->_locationManager->countTotalUserTerritory($idGame,$idUser,LocationManager.COLISEUM);
		$points += (is_null($coliseum)) ? 0 : $coliseum;
		
		
		
	}
	
	
	
}