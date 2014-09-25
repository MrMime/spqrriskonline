<?php


class LocationManager extends AbstractGenericManager
{
	
	public function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/location.xml');
	}
	
	
	public function countTotalUserTerritory($idUser,$idGame,$locationType){
		$query = trim($this->_xml->countUserTotalLocation);
		$parameters = array('id_game'=>$idGame);
		$parameters = array('id_user'=>$idUser);
		$parameters = array('location_type'=>$locationType);
		$this->_result = $this->_db->query($query,$parameters);
		return $this->_result;
	}
	
	public function countAllCloseTerritory($idGame){
		
		$allUser = tuttiIGiocatori($idGame);
		$userLocation = array();
		
		foreach ($allUser as $user){
			$allUserLocation = self::allUserLocationNoIsolation($idGame,$idUser);

			foreach ($allUserLocation as $location){
				//$userLocation[$location['id_location']] = array_merge(array($location->get('id_location')),self::__navigateFromPlace()
				
				
			}
			
			
		}
	}
	
	public function allUserLocationNoIsolation($idGame,$idUser){
		$query = trim($this->_xml->allUserLocationNoIsolation);
		$parameters = array('id_game'=>$idGame);
		$parameters = array('id_user'=>$idUser);
		$this->_result = $this->_db->query($query,$parameters);
		return $this->_result;
	}
	
	private function __navigateFromPlace($previousTerritory,$idTerritory){
		
	}
	
	
}
