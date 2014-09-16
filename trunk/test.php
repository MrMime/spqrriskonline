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
	
	$xml = simplexml_load_file('./db/cards.xml');
	echo '<pre>';
	$query = trim($xml->userCards);
	echo $query;
	$parameters = array('id_user'=>1,'id_game'=>1);
	print_r ($db->query($query,$parameters));
	
	echo '</pre>';


?>