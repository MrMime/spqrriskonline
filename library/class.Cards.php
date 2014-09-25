<?php

class Cards {
	
	const LEGIONARY 	= "Legionary";
	const FLAG 			= "Flag";
	const SHIP 			= "Ship";
	const COLISEUM 		= "Coliseum";

	
	public static function cardsToID($card){
		switch($card){
			case LEGIONARY: return 1; break;
			case FLAG: return 2; break;
			case SHIP: return 3; break;
			case COLISEUM: return 4; break;
		}
	}
	
}

?>