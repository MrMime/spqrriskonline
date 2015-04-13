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
include('library/class.UserManager.php');
include('library/class.Player.php');

$db = new PDFDatabase();
$db->connect("root", "", "spq_risk", "localhost:3306");
$GLOBALS['db'] = $db;

$_SESSION['id_game'] = 338;
$_SESSION['logManager'] = new LogManager();

 $gameManager = new GameManager();
 
 $uManager = new UserManager();
 
  echo '<pre>';
  
  $p1 = $uManager->loadUserById(1001);
  $p2 = $uManager->loadUserById(2001);
  
  if (!is_null($p1) && !is_null($p2)){
  	 $gameManager->makeTerranAttack($p1,3,$p2,3);
  }
 
 echo '</pre>';

// $data = array();
// // $data['game_name'] = 'TestTest';
// // $data['id_lang'] = 1;
// // $data['game_max_point'] = 25;

// //$id = $gameManager->createNewGame($data);

// // $data['id_game'] = '338';
// // $data['game_turn_number'] = 4;
// // $data['id_user_current_turn'] = 8;

// $data['id_game'] = '338';
// $data['id_user_winner'] = 8;

// $gameManager->endGame($data);

// echo 'ID: '.$id;

// $logManager = new LogManager();

// $data = array();
// $data['id_game'] = 338;
// $data['id_user_primary'] = 1001;
// $data['id_user_secondary'] = 2001;
// $data['log_text'] = "Sono un log 2";


// //$logManager->insertLog($data,LogManager::LOG_ATTACK);

// echo '<pre>';
// print_r ($logManager->selectLog(338,2,'2015-04-13 15:31:11'));
// echo '</pre>';





?>