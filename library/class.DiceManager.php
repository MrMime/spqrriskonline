<?php

class DiceManager {
	
	/**
	 * 
	 * Random number from 1 to 6
	 * @param Integer faces of dice
	 * @return Integer number from 1 to 6
	 */
	static function rollDice($face = 6){
		return rand(1, $face);
	}
	
	/**
	 * Roll a specific number of dices
	 * @param Integer $player1DiceNumber
	 * @param Integer $player2DiceNumber
	 * @return multitype:multitype:NULL
	 */
	static function rollCombatDice($player1DiceNumber,$player2DiceNumber){
		$p1Dices = array();
		for ($i=0;$i<$player1DiceNumber;$i++){
			$p1Dices[$i] = DiceManager::rollDice();
		}
		$p2Dices = array();
		for ($i=0;$i<$player2DiceNumber;$i++){
			$p2Dices[$i] = DiceManager::rollDice();
		}
		//Reverse array number from max to min
		rsort($p1Dices);
		rsort($p2Dices);
		
		return array($p1Dices,$p2Dices);
	}
	
}

?>