<?php


class LocationManager extends AbstractGenericManager
{
	
	const TERRAN_CONNECTION  	= 1;
	const SEA_CONNECTION  		= 2;
	
	const TERRAN_TERRITORY				= 1;
	const SEA_TERRITORY					= 2;
	const COLISEUM_TERRITORY			= 3;
	
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
	
	public function countUserLocation($idGame,$locationType = 1){
		$query = $this->_xml->countAllUsersLocation;
		$where =  $this->_commonXml->where;
		$where .= $this->_commonXml->filterByGame;
		$where .= $this->_xml->filterByLocationType;
		
		$parameters['id_game'] = $idGame;
		$parameters['location_type'] = $locationType;
		
		$query = str_replace('{where}',$where,$query);
		
		$this->_result = self::query($query,$parameters);
		
		$result = array();
		foreach ($this->_result as $userCounts){
			$result[$userCounts['id_user']] = $userCounts['total'];
		}
		return $result;
	}
	
	/**
	 * Count how many territory has a specific user for a specific games
	 * @param int $idGame
	 * @param int $idUser
	 * @param int $locationType
	 */
	public function countTotalUserTerritory($idGame,$idUser,$locationType){
		$usersTerritory = self::countUserLocation($idGame,$locationType);
		return $usersTerritory[$idUser];
	}
	
	/**
	 * Check if a user, between all user that has at least
	 * one ship in a sea territory, has the highest number of ship
	 * @param array $counts
	 */
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
	
	/**
	 * Generate an array of user with the number of sea territory
	 * REMEMBER: A user has a sea territory if its ship are more than other on
	 * same sea territory
	 * @param int $idGame
	 */
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
	}
	
	/**
	 * Return the User with the highest number of sea territory
	 * @param int $idGame
	 */
	public function userWithMostSeaTerritory($idGame){
		$userSeaLocation = self::countPlayerNavalTerritory($idGame);
		arsort($userSeaLocation);
		
		$users = array_keys($userSeaLocation);
		$first = array_shift($userSeaLocation);
		$second = array_shift($userSeaLocation);
		if ((!is_null($second) && $first > $second) || is_null($second)){
			return $users[0];
		}
		return null;
	}
	
	/**
	 * Return the User with the highest number of terran territory
	 * @param int $idGame
	 */
	public function userWithMostTerranTerritory($idGame){
		$usersTerritory = self::countUserLocation($idGame,self::TERRAN_TERRITORY);
		$users = array_keys($usersTerritory);
		$first = array_shift($usersTerritory);
		$second = array_shift($usersTerritory);
		if ($first > $second){
			return $users[0];
		}
		return null;
	}
	
	/**
	 * Get all territory connect to a specific territory
	 * for a specific user in a specifica game
	 * @param int $idGame
	 * @param int $idUser
	 * @param int $idLocation
	 * @param int $connectionType
	 */
	public function allTerritoryConnected($idGame,$idUser,$idLocation,$connectionType){
		$query = $this->_xml->allLocationConnected;
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$parameters['id_location'] = $idLocation;
		$parameters['connection_type'] = $connectionType;
		$result = self::query($query,$parameters); 
		return $result;
	}
	
	private function getNextTerritoryConnected($idGame,$idUser,$idLocationStart,&$idLocationAvoid,$connectionType){
		$query = $this->_xml->allLocationConnected;
		$query .= "AND LO.ID_LOCATION NOT IN (".implode (',',$idLocationAvoid).")";
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$parameters['id_location'] = $idLocationStart;
		$parameters['connection_type'] = $connectionType;
		$result = self::query($query,$parameters);
		if (count($result) == 0) return array();
		foreach ($result as $location) {
			$idLocationAvoid[] = $location['id_location'];
		}
		foreach ($result as $location) {
			$result = array_merge($result,self::getNextTerritoryConnected($idGame, $idUser, $location['id_location'], $idLocationAvoid, $connectionType));
		}
		return $result;
	}
	
	/**
	 * Count max number of connected territory for any users 
	 * @param int $idGame
	 */
	public function countAllCloseTerritory($idGame,$allUser){
		$userLocation = array();
		foreach ($allUser as $user){
			$allUserLocation = self::allUserLocationsNoIsolation($idGame,$user['id_user']);
			$idUser = $user['id_user'];
			$userLocation[$idUser] = 0;
			$avoidLocation[$idUser] = array();
			foreach ($allUserLocation as $location){
				if (!in_array($location['id_location'],$avoidLocation[$idUser])){
					$avoidLocation[$user['id_user']][] = $location['id_location'];
					$userLocation[$idUser] = max($userLocation[$idUser],1+count(self::getNextTerritoryConnected($idGame,$idUser,$location['id_location'],$avoidLocation[$idUser],self::TERRAN_CONNECTION)));
				}
			}
		}
		return $userLocation;
	}
	
	/**
	 * Get all user location filtered by location type
	 * @param int $idGame
	 * @param int $idUser
	 * @param int $locationType
	 */
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
	
	
	/**
	 * Get all user terran location without islands
	 * @param int $idGame
	 * @param int $idUser
	 */
	public function allUserLocationsNoIsolation($idGame,$idUser){
		$query = trim($this->_xml->allGameLocation);
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		$query .= $this->_commonXml->filterByGame;
		$query .= $this->_xml->filterIslandLocation;
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$this->_result = self::query($query,$parameters);
		return $this->_result;
	}
	
}
