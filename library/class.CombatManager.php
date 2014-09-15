<?php

class CombatManager
{
	
	/**
	 * 
	 * Make a terran attack from Player1 to Player2
	 * @param Integer player1 unit
	 * @param Integer player2 unit
	 * @return array of number of unit remaining
	 */
	static function terranAttack($player1,$player2,&$logManager){
		$dices = DiceManager::rollCombatDice($player1, $player2);
		$logManager->addLog('{Player1} rolls '.implode(";",array_values($dices[0])));
		$logManager->addLog('{Player2} rolls '.implode(";",array_values($dices[1])));
		
		$unitRemaining = array(0=>$player1,1=>$player2);

		for ($i=0;$i<count($dices[1]);$i++){
			if ($dices[0][$i] <= $dices[1][$i]){
				$unitRemaining[0] = max(0,$unitRemaining[0]-1);
			}
			else {
				$unitRemaining[1] = max(0,$unitRemaining[1]-1);
			}
		}
		return $unitRemaining;
	}
	
	/**
	 * 
	 * Make a bySea attack that involve all
	 * player 1 unit until one of two player lost
	 * all unit
	 * @param Integer $player1 unit attacking
	 * @param Integer $player2 unit defending
	 * @return array of number of unit remaining
	 */
	static function bySeaAttack($player1,$player2,&$logManager){
		$p1Unit = $player1;
		$p2Unit = $player2;
		while ($p1Unit > 0 && $p2Unit > 0){
			$p1Dice = ($p1Unit <= 3) ? $p1Unit : 3;
			$p2Dice = ($p2Unit <= 3) ? $p2Unit : 3;
			$unitRemaning = CombatManager::terranAttack($p1Dice, $p2Dice,$logManager);
			$p1Unit = $unitRemaning[0];
			$p2Unit = $unitRemaning[1];
		}
		return array(max(0,$p1Unit),max(0,$p2Unit));
	}
	
	/**
	 * 
	 * Make a Sea attack. Equal Dices break completely the combat
	 * @param Integer $player1 unit attacking
	 * @param Integer $player2 unit defending
	 * @return array of number of unit remaining
	 */
	static function seaAttack($player1,$player2,&$logManager){
		$dices = DiceManager::rollCombatDice($player1, $player2);
		$unitRemaining = array(0=>$player1,1=>$player2);
		
		$logManager->addLog('{Player1} rolls '.implode(";",array_values($dices[0])));
		$logManager->addLog('{Player2} rolls '.implode(";",array_values($dices[1])));
		
		for ($i=0;$i<count($dices[1]);$i++){
			if ($dices[0][$i] == $dices[1][$i]) return $unitRemaining;
			if ($dices[0][$i] <= $dices[1][$i]){
				$unitRemaining[0] = max(0,$unitRemaining[0]-1);
			}
			else {
				$unitRemaining[1] = max(0,$unitRemaining[1]-1);
			}
		}
		return $unitRemaining;
	}
	
	
	
}