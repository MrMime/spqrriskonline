<?php


class LocationManager extends AbstractGenericManager
{
	
	public function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/locations.xml');
	}
	
	
	public function countTotalUserTerritory($idGame,$idUser,$locationType){
		$query = trim($this->_xml->countUserTotalLocation);
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		$query .= $this->_commonXml->filterByGame;
		$query .= $this->_xml->filterByLocationType;
		
		$parameters = array('id_game'=>$idGame,'id_user'=>$idUser,'location_type'=>$locationType);
		$this->_result = self::query($query,$parameters);
		return $this->_result;
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
		
		$allUser = $this->_gameManager->allGameUsers(1);
//		$userLocation = array();
//		
		foreach ($allUser as $user){
			$allUserLocation = self::allUserLocationsNoIsolation($idGame,$user['id_user']);
			echo '<br><br>UTENTE '.$user['user_name'].'<br>';
			foreach ($allUserLocation as $location){
				echo 'LUOGO '.$location['location_name'].'<br>';
				print_r (self::allTerritoryConnected($idGame,$user['id_user'],$location['id_location'],1));
			}
			
		}
//
//			foreach ($allUserLocation as $location){
//				//$userLocation[$location['id_location']] = array_merge(array($location->get('id_location')),self::__navigateFromPlace()
//				
//				
//			}
//			
//			
//		}
	}
	
	public function allUserLocations($idGame,$idUser){
		$query = trim($this->_xml->allUserLocation);
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		$query .= $this->_commonXml->filterByGame;
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$this->_result = self::query($query,$parameters);
		return $this->_result;
	}
	
	public function allUserLocationsNoIsolation($idGame,$idUser){
		$query = trim($this->_xml->allUserLocation);
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
	
	private function __navigateFromPlace($previousTerritory,$idTerritory){
		
	}
	
	
}
