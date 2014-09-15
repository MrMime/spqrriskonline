<?php

	include('library/class.Cards.php');
	include('library/class.CardsManager.php');
	include('library/class.DiceManager.php');
	include('library/class.CombatManager.php');
	include('library/class.LogManager.php');
	
	$logManager = new LogManager();
	
	echo '<pre>';
	//print_r (CombatManager::bySeaAttack(18, 8,$logManager));
	$unitLost = CombatManager::seaAttack(3, 2, $logManager);
	echo 'P1 rimane con '.(3-$unitLost[0]).' P2 rimane con '.(2-$unitLost[1]); 
	print_r ($logManager->getLog());
	echo '</pre>';


?>