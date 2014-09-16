<?php


class UnitManager
{
	const LEGIONARY = "Legionary";
	const SHIP		= "Ship";
	const COLISEUM	= "Coliseum"; 
	
	public function __construct(){
		
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
	
	
}