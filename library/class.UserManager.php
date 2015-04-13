<?php

class UserManager extends AbstractGenericManager
{
	
	public function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/users.xml');
	}
	
	public function loadUserById($id){
		$query = $this->_xml->loadUserById;
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByUser;
		
		$parameters['id_user'] = $id;
		$dd = self::query($query,$parameters);
		if (isset($dd[0])){
			$pp = new Player($dd[0]);
			return $pp;
		}
		return null;
	}
	
}