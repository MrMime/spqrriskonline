<?php

	include('library/class.Cards.php');
	include('library/class.CardsManager.php');
	include('library/class.DiceManager.php');
	include('library/class.CombatManager.php');
	include('library/class.LogManager.php');
	include('library/class.UnitManager.php');
	
	$uManager = new UnitManager();
	
	echo '<pre>';
	for ($i = 1;$i<25;$i++){
		echo $i.': '.$uManager->startLegionary($i);
		echo '<br>';
	}
	echo '</pre>';


?>