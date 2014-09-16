<?php

class PDFDatabase 
{
	private $_pdo_interface = null;
	private $_lastId 		= null;
	
	public function __construct(){
		
	}
	
	public function connect($user,$pw,$dbName,$dbHost){
		$dsnPdo = 'mysql:dbname='.$dbName.';host='.$dbHost;
		$this->_pdo_interface = new PDO($dsnPdo, $user, $pw);
		$this->_pdo_interface->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	
	public function getLastId(){
		return $this->_lastId;
	}
	
	public function query($query,$parameters){
		$stmt = $this->_pdo_interface->prepare($query);
		try {
			if ($stmt->execute($parameters)){
				if (preg_match('/^INSERT/',$query)){
					$this->_lastId = $pdo_interface->lastInsertId();
					return $this->_lastId;
				}
				if (preg_match('/^SELECT/',$query)){
					$returnArray = array();
					foreach ($stmt as $row) {
						$returnArray[] = $row;
					}
					return $returnArray;
				}
			}
			else {
				//TODO: Logga errore
			}
		}
		catch(PDOException $e){
			
		}
	}
	
	
	
	
}

?>