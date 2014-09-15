<?php

	include('library/class.Cards.php');
	include('library/class.CardsManager.php');
	include('library/class.DiceManager.php');
	include('library/class.CombatManager.php');
	include('library/class.LogManager.php');
	
	$logManager = new LogManager();
	
	echo '<pre>';
	print_r (CombatManager::bySeaAttack(18, 8,$logManager));
	print_r ($logManager->getLog());
	echo '</pre>';


?>