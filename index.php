<?php

require_once('library/language/en_EN.php');
require_once('library/language/it_IT.php');

require_once('library/class.AbstractGenericManager.php');
require_once('library/class.Cards.php');
require_once('library/class.CardsManager.php');
require_once('library/class.DiceManager.php');
require_once('library/class.CombatManager.php');
require_once('library/class.LogManager.php');
require_once('library/class.UnitManager.php');
require_once('library/class.PDODatabase.php');
require_once('library/class.GameManager.php');
require_once('library/class.LocationManager.php');
require_once('library/class.UserManager.php');
require_once('library/class.Player.php');

require_once('library/class.Layout.php');
require_once('library/class.Referee.php');

$db = new PDFDatabase();
$db->connect("root", "", "spq_risk", "localhost:3306");
$GLOBALS['db'] = $db;

$_SESSION['id_game'] = 338;
$_SESSION['logManager'] = new LogManager();
$_SESSION['lang'] = 'it';

$lay = new Layout();

$ref = new Referee();

$pp = $ref->getPageFromGet($_REQUEST);

$lay->setContentPage($pp);


echo $lay->getPage();


?>