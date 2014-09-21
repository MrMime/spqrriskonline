<?php

class PDFDatabase 
{
	private $_pdo_interface = null;
	private $_lastId 		= null;
	
	public function __construct(){
		
	}
	
	/**
	 * Make a connection to DB with PDO Interface
	 * @param String $user DB User
	 * @param String $pw DB Password
	 * @param String $dbName DB Name
	 * @param String $dbHost DB Host and port
	 */
	public function connect($user,$pw,$dbName,$dbHost){
		$dsnPdo = 'mysql:dbname='.$dbName.';host='.$dbHost;
		$this->_pdo_interface = new PDO($dsnPdo, $user, $pw);
		$this->_pdo_interface->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	
	public function getLastId(){
		return $this->_lastId;
	}
	
	/**
	 * Execute a Query with relative parameters
	 * @param String $query
	 * @param Array $parameters
	 * @return Last ID of query is Insert |Array if query is SELECT
	 */
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
					$returnArray = $stmt->fetchAll(PDO::FETCH_ASSOC);
					return $returnArray;
				}
			}
		}
		catch(PDOException $e){
			$errarray = debug_backtrace();
 			print ("<pre>");
 			print ("<h3>ERROR STACK TRACE</h3>");
 			print ("<b>query: ".$query." (CODE: ". $stmt->errorCode() .")</b><br />");
 			print_r($stmt->errorInfo());
 			print ("</pre>");
 			
 			for ($i = 0; $i < count($errarray); $i++) {
 				print('<b>file:</b> '.$errarray[$i]["file"].'<br />');
 				print('<b>function:</b> '.$errarray[$i]["function"].'<br />');
 				print('<b>line:</b> '.$errarray[$i]["line"].'<br />');
 			}
		}
	}
	
	
	
	
}

?>