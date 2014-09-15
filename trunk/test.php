<?php

	include('class.Cards.php');
	include('class.CardsManager.php');
	
	$carte = array();
	
	$carte[0] = Cards.FLAG;
	$carte[1] = Cards.FLAG;
	$carte[2] = Cards.COLISEUM;
	
	if (CardsManager::checkIfExchangeAvaiable($carte)){
		echo 'posso'; 
	}
	else {
		echo 'noposso';
	}
	
	try {
		CardsManager::getUnitForChange($carte);
	}
	catch (Exception $e){
		echo $e->getMessage();
	}


?>