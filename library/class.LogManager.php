<?php


class LogManager
{
	
	protected $_log = array();

	public function addLog($text){
		$this->_log[] = $text;
	}
	
	public function getLog(){
		return $this->_log;
	}
	
}