<?php

	include('library/class.Cards.php');
	include('library/class.CardsManager.php');
	include('library/class.DiceManager.php');
	include('library/class.CombatManager.php');
	include('library/class.LogManager.php');
	include('library/class.UnitManager.php');
	include('library/class.PDODatabase.php');
	
	$db = new PDFDatabase();
	$db->connect("root", "", "spq_risk", "localhost:3306");
	$data = $db->query("SELECT * FROM spq_risk_turn_phase_name", null);
	
	$xml = simplexml_load_file('./db/cards.xml');
	
	echo '<pre>';
	echo (trim($xml->sql[0]));
	echo '</pre>';


?>