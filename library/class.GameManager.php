<?php


class GameManager extends AbstractGenericManager
{
	
	private $_idGame = null;
	
	function __construct(){
		global $locationManager;
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/game.xml');
		$this->_locationManager = $locationManager;
	}
	
	function getIdGame(){
		if (is_null($this->_idGame)) $this->_idGame = $_SESSION['id_game'];
		return $this->_idGame;
	}
	
	function currentGamePhase($idGame){
		$query = trim($this->_xml->currentGamePhase);
		$parameters = array('id_game'=>$idGame);
		$this->_result = $this->_db->query($query,$parameters);
		return $this->_result;
	}
	
	function currentGameUserPhase($idGame){
		$query = trim($this->_xml->currentGameUserPhase);
		$parameters = array('id_game'=>$idGame);
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
	
	
	/**
	 * Create a New Game
	 * @param String $data with required: game_name, id_lang, game_max_point
	 */
	public function createNewGame($data){
		$query = $this->_xml->insert;
		$data['game_creation_date'] = date('Y-m-d');
		$_SESSION['game']['currentGame']['idGame'] = self::query($query,$data); 
		return $_SESSION['game']['currentGame']['idGame'];
	}
	
	public function updateGameTurn($data){
		$query = $this->_xml->updateGameTurn;
		return self::query($query,$data);
	}
	
	public function endGame($data){
		$query = $this->_xml->endGame;
		$data['game_end_date'] = date('Y-m-d');
		return self::query($query,$data);
	}
	
	/**
	 * Delegate method for Combat Manager
	 */
	public function makeTerranAttack ($p1,$p1Dice,$p2,$p2Dice){
		$result = CombatManager::terranAttack($p2Dice,$p2Dice,self::getLogManager(),$this->_language);
		$parameters = array('Player1'=>$p1->getUserName(),'Player2'=>$p2->getUserName());
		self::getLogManager()->saveLog(self::getIdGame(),$p1->getIdUser(),$p2->getIdUser(),LogManager::LOG_ATTACK,$parameters);
		return $result;		
	}
	
	public function makeBySeaAttack($p1,$p1Dice,$p2,$p2Dice){
		$result = CombatManager::bySeaAttack($p2Dice,$p2Dice,self::getLogManager(),$this->_language);
		$parameters = array('Player1'=>$p1->getUserName(),'Player2'=>$p2->getUserName());
		self::getLogManager()->saveLog(self::getIdGame(),$p1->getIdUser(),$p2->getIdUser(),LogManager::LOG_ATTACK,$parameters);
		return $result;
	}
	
	public function makeSeaAttack($p1,$p1Dice,$p2,$p2Dice){
		$result = CombatManager::seaAttack($p2Dice,$p2Dice,self::getLogManager(),$this->_language);
		$parameters = array('Player1'=>$p1->getUserName(),'Player2'=>$p2->getUserName());
		self::getLogManager()->saveLog(self::getIdGame(),$p1->getIdUser(),$p2->getIdUser(),LogManager::LOG_ATTACK,$parameters);
		return $result;
	}
	
	
}