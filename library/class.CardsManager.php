<?php

class CardsManager {
	
	protected $_grimoryBase = array();
	
	
	public function baseGrimory(){
		$this->_grimoryBase[Cards.LEGIONARY] = 25;
		$this->_grimoryBase[Cards.COLISEUM] = 5;
		$this->_grimoryBase[Cards.FLAG] = 15;
		$this->_grimoryBase[Cards.SHIP] = 10;
		
	}
	
	
	/**
	 * 
	 * Translate 3 cards in relative units 
	 * @param array of CARDS $tris 
	 * @return array of units [0] terran unit; [1] naval unit; [2] coliseum
	 */
	static function getUnitForChange($tris){
		if (!CardsManager::checkIfExchangeAvaiable($tris)){
			throw new Exception("Invalid set of Cards", "001");
		}
		
		$totalLegionary = 0;
		if ($tris[0] == $tris[1] && $tris[1] == $tris[2]){
			$totalLegionary = 8;
		}
		if ($tris[0] != $tris[1] && $tris[1] != $tris[2]){
			$totalLegionary = 10;
		}
		$addedLegionary = 0;
		$ship = 0;
		$coliseum = 0;
		foreach($tris as $card){
			if ($card == Cards.FLAG){
				$addedLegionary += 2;
			}
			if ($card == Cards.COLISEUM){
				$coliseum +=1;
			}
			if ($card == Cards.SHIP){
				$ship += 1;
			}
		}
		return array($totalLegionary+$addedLegionary,$ship,$coliseum);
	}
	
	/**
	 * Check if user has at least one cards change to be done
	 * @param array of CARDS $totalCards
	 * @return boolean true if at least one exchange can be done
	 */
	static function checkIfExchangeAvaiable($totalCards){
		if (count($totalCards) < 3) return false;
		//I can change if at least three are equals or different
		$result  = array_count_values($totalCards);
		//If count >= 3, I have at least three different cards
		if (count($result) >= 3) return true;
		//If I come here, I have only two cards type so I need to check if one of them has 3 copies
		$values = array_values($result);
		if ($values[0] == 3 || $values[1] == 3) return true;
		
		return false;
	}
	
}


?>