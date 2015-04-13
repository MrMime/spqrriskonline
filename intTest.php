<?php

class foo{
	
	private $_id;
	
	function __construct($id){
		$this->_id = $id;
	}
	
	function setId($id){
		$this->_id = $id;
	}
	
	function &getId(){
		return $this->_id;
	}
	
}



$ciao = new foo(3);
$addio = new foo(4);

$addio->setId($ciao->getId());

echo 'A: '.$addio->getId();
echo '<br>';
$ciao->setId(5);
echo 'B: '.$addio->getId();




?>