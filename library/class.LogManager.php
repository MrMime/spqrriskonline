<?php


class LogManager extends AbstractGenericManager
{
	
	const LOG_GAME		= 1;
	const LOG_ATTACK 	= 2;
	const LOG_CARDS		= 3;
	
	protected $_log = array();
	
	function __construct(){
		parent::__construct();
		$this->_xml = simplexml_load_file('./db/log.xml');
	}
	
	protected function __orNull($data,$label){
		return !isset($data[$label]) ? null : $data[$label];
	}

	public function addLog($text){
		$this->_log[] = $text;
	}
	
	public function getLog(){
		return $this->_log;
	}
	
	private function __replaceParameters($base,$parameters){
		foreach ($parameters as $key=>$value){
			$base = str_replace('{'.$key.'}',$value,$base);
		}
		return $base;
	}
	
	public function saveLog($idGame,$idUser01,$idUser02,$logType,$parameters){
		$data = array();
		$data['id_game'] = $idGame;
		$data['id_user_primary'] = $idUser01;
		$data['id_user_secondary'] = $idUser02;
		foreach ($this->_log as $log){
			$data['log_text'] = $log;
			$data['log_text'] = self::__replaceParameters($data['log_text'],$parameters);
			self::insertLog($data, $logType);
		}
		$this->_log = array();
	}
	
	
	public function insertLog($data,$logType){
		$query = $this->_xml->insertLog;
		//Required
		$data['log_date'] = date('Y-m-d H:i:s');
		$data['log_type'] = $logType;
		//Optionals
		$data['id_user_primary'] = self::__orNull($data,'id_user_primary');
		$data['id_user_secondary'] = self::__orNull($data,'id_user_secondary');
		$data['id_location_primary'] = self::__orNull($data,'id_location_primary');
		$data['id_location_secondary'] = self::__orNull($data,'id_location_secondary');
		return self::query($query,$data);
	}
	
	public function selectLog($idGame,$logType = null,$dateFrom = null){
		$condition = '';
		if ($logType != null) $condition = ' AND log_type = '.$logType;
		
		$query = $this->_xml->selectLogs;
		$query .= $this->_commonXml->where;
		$query .= $this->_commonXml->filterByGame;
		
		$query .= $condition;
		
		if ($dateFrom != null) {
			$query .= str_replace('[[datefield]]','log_date',$this->_commonXml->filterByStricklyDateFrom);
			$parameters['date_from'] = $dateFrom;
		}
		
		$parameters['id_game'] = $idGame;
		
		return self::query($query,$parameters);
		
	}
	
}