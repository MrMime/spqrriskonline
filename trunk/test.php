<?php

	include('library/class.Cards.php');
	include('library/class.CardsManager.php');
	include('library/class.DiceManager.php');
	include('library/class.CombatManager.php');
	include('library/class.LogManager.php');
	include('library/class.UnitManager.php');
	include('library/class.PDODatabase.php');
	include('library/class.GameManager.php');
	
	$db = new PDFDatabase();
	$db->connect("root", "", "spq_risk", "localhost:3306");
	$GLOBALS['db'] = $db;
	
	$gManager = new GameManager();
	
	echo '<pre>';
	print_r ($gManager->currentGamePhase(1));
	echo '</pre>';


?>