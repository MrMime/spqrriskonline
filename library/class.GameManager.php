<?php


class GameManager extends AbstractGenericManager
{
	function __construct(){
		global $locationManager;
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/game.xml');
		$this->_locationManager = $locationManager;
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
			$points+=1;
		}
		
		//check how many coliseum has the user
		$coliseum = $this->_locationManager->countTotalUserTerritory($idGame,$idUser,LocationManager.COLISEUM);
		$points += (is_null($coliseum)) ? 0 : $coliseum;
		
		$idUserMostTerritory = $this->_locationManager->userWithMostTerranTerritory($idGame);
		if ($idUser == $idUserMostTerritory){
			$points+=1;
		}
		
		$maxUserTerritoryConnected = $this->_locationManager->countAllCloseTerritory($idGame,self::allGameUsers($idGame));
		arsort($maxUserTerritoryConnected);
		$users = array_keys($maxUserTerritoryConnected);
		$first = array_shift($maxUserTerritoryConnected);
		$second = array_shift($maxUserTerritoryConnected);
		if ($first > $second && $users[0] == $idUser){
			$points+=1;
		}
		return $points;
	}
	
	
	function createNewGame($data){
		
	
	}
	
	
	
}