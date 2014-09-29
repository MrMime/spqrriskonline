<?php


class LocationManager extends AbstractGenericManager
{
	
	public function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/locations.xml');
	}
	
	public function allGameLocation($idGame,$locationType = null){
		$query = $this->_xml->allGameLocation;
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByGame;
		$parameters['id_game'] = $idGame;
		if (!is_null($locationType)){
			$query .= $this->_xml->filterByLocationType;
			$parameters['location_type'] = $locationType;
		}
		return self::query($query,$parameters);
	}
	
	public function countTotalUserTerritory($idGame,$idUser,$locationType){
		$query = $this->_xml->countGameTotalLocation;
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		$query .= $this->_commonXml->filterByGame;
		$query .= $this->_xml->filterByLocationType;
		
		$parameters = array('id_game'=>$idGame,'id_user'=>$idUser,'location_type'=>$locationType);
		$this->_result = self::query($query,$parameters);
		return $this->_result;
	}
	
	private function __checkSeaLocation($counts){
		arsort($counts);
		$users = array_keys($counts);
		$first = array_shift($counts);
		$second = array_shift($counts);
		if ((!is_null($second) && $first > $second) || is_null($second)){
			return $users[0];
		}
		return null;
	}
	
	public function countPlayerNavalTerritory($idGame){
		$query = $this->_xml->allGameLocation;
		$query .= $this->_xml->joinSeaLocation;
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByGame;
		$query .= $this->_xml->orderBySeaLocation;
		$parameters['id_game'] = $idGame;
		$this->_result = self::query($query,$parameters);
		
		$seaLocation = array();
		foreach ($this->_result as $location){
			$seaLocation[$location['id_sea_location']][$location['id_user']] = $location['units'];			
		}
		
		$userSeaLocation = array();
		foreach ($seaLocation as $idSeaLocation=>$userCounts){
			$idUser = self::__checkSeaLocation($userCounts);
			if (!is_null($idUser)){
				$userSeaLocation[$idUser] += 1;
			}
		}
		
		return $userSeaLocation;
		
//		$allUser = $this->_gameManager->allGameUsers($idGame);
//		$userLocation = array();
//		foreach ($allUser as $user){
//			$allUserLocation = self::allUserLocations($idGame,$user['id_user'],2);
//			
//		}
	}
	
	public function allTerritoryConnected($idGame,$idUser,$idLocation,$connectionType){
		$query = trim($this->_xml->allLocationConnected);
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$parameters['id_location'] = $idLocation;
		$parameters['connection_type'] = $connectionType;
		return self::query($query,$parameters);
	}
	
	public function countAllCloseTerritory($idGame){
		$allUser = $this->_gameManager->allGameUsers($idGame);
		$userLocation = array();
		foreach ($allUser as $user){
			$allUserLocation = self::allUserLocationsNoIsolation($idGame,$user['id_user']);
			//echo '<br><br>UTENTE '.$user['user_name'].'<br>';
			$userLocation[$user['id_user']] = 0;
			foreach ($allUserLocation as $location){
				//echo 'LUOGO '.$location['location_name'].'<br>';
				$userLocation[$user['id_user']] = max($userLocation[$user['id_user']],1+count(self::allTerritoryConnected($idGame,$user['id_user'],$location['id_location'],1)));
			}
		}
		return $userLocation;
	}
	
	public function allUserLocations($idGame,$idUser,$locationType = null){
		$query = trim($this->_xml->allGameLocation);
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		$query .= $this->_commonXml->filterByGame;
		if (!is_null($locationType)){
			$query .= $this->_xml->filterByLocationType;
			$parameters['location_type'] = $locationType;
		}
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$this->_result = self::query($query,$parameters);
		return $this->_result;
	}
	
	public function allUserLocationsNoIsolation($idGame,$idUser){
		$query = trim($this->_xml->allGameLocation);
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		$query .= $this->_commonXml->filterByGame;
		$query .= $this->_xml->filterLocation;
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$parameters['id_locations'] = '100,4500,4200,4300,4100,2700,2600'; //isolated location
		$this->_result = self::query($query,$parameters);
		return $this->_result;
	}
	
}
