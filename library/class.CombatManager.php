<?php

class CombatManager
{
	
	/**
	 * 
	 * Make a terran attack from Player1 to Player2
	 * @param Integer player1 unit
	 * @param Integer player2 unit
	 * @return array of number of unit lost
	 */
	static function terranAttack($player1,$player2,&$logManager,$language){
		$dices = DiceManager::rollCombatDice($player1, $player2);
		$logManager->addLog('{Player1} '.$language['rolls'].' '.implode(";",array_values($dices[0])));
		$logManager->addLog('{Player2} '.$language['rolls'].' '.implode(";",array_values($dices[1])));
		
		$unitLost = array(0=>0,1=>0);
		for ($i=0;$i<count($dices[1]);$i++){
			if ($dices[0][$i] <= $dices[1][$i]){
				$unitLost[0] += 1;
			}
			else {
				$unitLost[1] += 1;
			}
		}
		
		$logManager->addLog('{Player1} '.$language['losts'].' '.$unitLost[0].' '.$language['units']);
		$logManager->addLog('{Player2} '.$language['losts'].' '.$unitLost[1].' '.$language['units']);
		
		return $unitLost;
	}
	
	/**
	 * 
	 * Make a bySea attack that involve all
	 * player 1 unit until one of two player lost
	 * all unit
	 * @param Integer $player1 unit attacking
	 * @param Integer $player2 unit defending
	 * @return array of number of unit lost
	 */
	static function bySeaAttack($player1,$player2,&$logManager,$language){
		$p1Unit = $player1;
		$p2Unit = $player2;
		
		$p1UnitLost = 0;
		$p2UnitLost = 0;
		while ($p1Unit > 0 && $p2Unit > 0){
			$p1Dice = ($p1Unit <= 3) ? $p1Unit : 3;
			$p2Dice = ($p2Unit <= 3) ? $p2Unit : 3;
			$unitLost = CombatManager::terranAttack($p1Dice, $p2Dice,$logManager,$language);
			$p1Unit = $p1Unit-$unitLost[0];
			$p1UnitLost += $unitLost[0];
			$p2Unit = $p2Unit-$unitLost[1];
			$p2UnitLost += $unitLost[1];
		}
		
		echo 'ciao';
		
		$logManager->addLog('{Player1} '.$language['losts'].' '.$p1UnitLost.' '.$language['units']);
		$logManager->addLog('{Player2} '.$language['losts'].' '.$p2UnitLost.' '.$language['units']);
		
		return array($p1UnitLost,$p2UnitLost);
	}
	
	/**
	 * 
	 * Make a Sea attack. Equal Dices break completely the combat
	 * @param Integer $player1 unit attacking
	 * @param Integer $player2 unit defending
	 * @return array of number of unit lost
	 */
	static function seaAttack($player1,$player2,&$logManager,$language){
		$dices = DiceManager::rollCombatDice($player1, $player2);
		$unitLost = array(0=>0,1=>0);
		
		$logManager->addLog('{Player1} '.$language['rolls'].' '.implode(";",array_values($dices[0])));
		$logManager->addLog('{Player2} '.$language['rolls'].' '.implode(";",array_values($dices[1])));
		
		for ($i=0;$i<count($dices[1]);$i++){
			if ($dices[0][$i] == $dices[1][$i]) return $unitLost;
			if ($dices[0][$i] <= $dices[1][$i]){
				$unitLost[0] += 1;
			}
			else {
				$unitLost[1] += 1;
			}
		}
		
		$logManager->addLog('{Player1} '.$language['losts'].' '.$unitLost[0].' '.$language['units']);
		$logManager->addLog('{Player2} '.$language['losts'].' '.$unitLost[1].' '.$language['units']);
		
		return $unitLost;
	}
	
	
	
}