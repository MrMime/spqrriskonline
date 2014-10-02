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
	
	$uManager = new UnitManager();
	
	echo '<pre>';
	
	//print_r ($lManager->countAllCloseTerritory(334,$gManager->allGameUsers(334)));
	
	print_r($gManager->countIniRoundUserPoint(334, 1001));
	
	print_r($gManager->countIniRoundUserPoint(334, 1200));
	
	print_r($gManager->countIniRoundUserPoint(334, 3900));
	
	
//	$uManager->addUnitsToTerritory(334, 1001, 100,3);
//	$uManager->addUnitsToTerritory(334, 1001, 200,2);
//	$uManager->addUnitsToTerritory(334, 1001, 300,3);
//	$uManager->addUnitsToTerritory(334, 1001, 3800,5);
//	$uManager->addUnitsToTerritory(334, 1001, 3700,6);
//	$uManager->addUnitsToTerritory(334, 1001, 4000,6);
//	$uManager->addUnitsToTerritory(334, 1001, 4100,2);
//	$uManager->addUnitsToTerritory(334, 1001, 1000,3);
//	$uManager->addUnitsToTerritory(334, 1001, 1100,1);
//	$uManager->addUnitsToTerritory(334, 1001, 1200,2);
//	$uManager->addUnitsToTerritory(334, 1001, 1700,3);
//	$uManager->addUnitsToTerritory(334, 1001, 2000,5);
//	$uManager->addUnitsToTerritory(334, 1001, 2400,6);
	
//	$uManager->addUnitsToTerritory(334, 1200, 700,3);
//	$uManager->addUnitsToTerritory(334, 1200, 800,2);
//	$uManager->addUnitsToTerritory(334, 1200, 3900,3);
//	$uManager->addUnitsToTerritory(334, 1200, 3600,3);
//	$uManager->addUnitsToTerritory(334, 1200, 3500,4);
//	$uManager->addUnitsToTerritory(334, 1200, 3400,4);
//	$uManager->addUnitsToTerritory(334, 1200, 3200,6);
//	$uManager->addUnitsToTerritory(334, 1200, 3300,5);
//	$uManager->addUnitsToTerritory(334, 1200, 3100,7);
//	$uManager->addUnitsToTerritory(334, 1200, 3000,8);
//	$uManager->addUnitsToTerritory(334, 1200, 2900,9);
//	$uManager->addUnitsToTerritory(334, 1200, 2700,4);
//	$uManager->addUnitsToTerritory(334, 1200, 2800,10);
//	$uManager->addUnitsToTerritory(334, 1200, 2500,3);
//	$uManager->addUnitsToTerritory(334, 1200, 2200,3);
//	$uManager->addUnitsToTerritory(334, 1200, 2300,3);
//	$uManager->addUnitsToTerritory(334, 1200, 2100,4);
//	$uManager->addUnitsToTerritory(334, 1200, 2600,3);
//	
//	
//	$uManager->addUnitsToTerritory(334, 3900, 400,3);
//	$uManager->addUnitsToTerritory(334, 3900, 500,2);
//	$uManager->addUnitsToTerritory(334, 3900, 4400,1);
//	$uManager->addUnitsToTerritory(334, 3900, 600,1);
//	$uManager->addUnitsToTerritory(334, 3900, 900,3);
//	$uManager->addUnitsToTerritory(334, 3900, 4500,4);
//	$uManager->addUnitsToTerritory(334, 3900, 4300,4);
//	$uManager->addUnitsToTerritory(334, 3900, 4200,5);
//	$uManager->addUnitsToTerritory(334, 3900, 1300,5);
//	$uManager->addUnitsToTerritory(334, 3900, 1400,5);
//	$uManager->addUnitsToTerritory(334, 3900, 1500,5);
//	$uManager->addUnitsToTerritory(334, 3900, 1600,5);
//	$uManager->addUnitsToTerritory(334, 3900, 1800,5);
//	$uManager->addUnitsToTerritory(334, 3900, 1900,5);
	
	echo '</pre>';


?>