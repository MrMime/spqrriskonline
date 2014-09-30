<?php

	include('library/class.AbstractGenericManager.php');
	include('library/class.Cards.php');
	include('library/class.CardsManager.php');
	include('library/class.DiceManager.php');
	include('library/class.CombatManager.php');
	include('library/class.LogManager.php');
	include('library/class.UnitManager.php');
	include('library/class.PDODatabase.php');
	include('library/class.GameManager.php');
	include('library/class.LocationManager.php');
	
	$db = new PDFDatabase();
	$db->connect("root", "", "spq_risk", "localhost:3306");
	$GLOBALS['db'] = $db;
	
	$lManager = new LocationManager();
	$GLOBALS['locationManager'] = $lManager;
	
	$gManager = new GameManager();
	$GLOBALS['gameManager'] = $gManager;
	
	
	
	echo '<pre>';
	print_r ($gManager->countIniRoundUserPoint(1,1));
	echo '</pre>';


?>