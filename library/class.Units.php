<?php
 class Units
 {
 	
 	const LEGIONARY = "Legionary";
	const SHIP		= "Ship";
	const COLISEUM	= "Coliseum"; 
	
	
 	public static function unitsToID($unit){
		switch($unit){
			case LEGIONARY: return 1; break;
			case SHIP: return 2; break;
			case COLISEUM: return 3; break;
		}
	}
 	
 	
 }