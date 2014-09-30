<?php


class UnitManager extends AbstractGenericManager
{
	const LEGIONARY = "Legionary";
	const SHIP		= "Ship";
	const COLISEUM	= "Coliseum"; 
	
	public function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/units.xml');
	}
	
	/**
	 * 
	 * Return amount of unit due to max number of territory
	 * @param unknown_type $territory
	 */
	public function startLegionary($territory){
		if ($territory < 3){
	        return 1;
	    }      
	    if ($territory <=11){
	        return 3;
	    }      
	    return (int) (3 + (floor((($territory - 9) / 3))));
	}
	
	
	public function addUnitsToTerritory($idGame,$idUser,$idLocation,$units){
		$query = $this->_xml->addUnitToTerritory;
		
		$parameters['id_game'] = $idGame;
		$parameters['id_user'] = $idUser;
		$parameters['id_location'] = $idLocation;
		$parameters['unit_number'] = $units;
		
		self::query($query,$parameters);
		
	}
	
	
}