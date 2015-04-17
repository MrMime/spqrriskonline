<?php

class Layout
{
	
	private $_basePage 		= null;
	private $_currentPage 	= null;
	private $_finalPage		= null;
	
	private $_pagePath		= null;
	private $_layPath		= './layout/';
	
	public function __construct($pagePath = null){
		$this->_currentPage = $this->_finalPage = "";
		$this->_pagePath = (is_null($pagePath)) ? $this->_layPath : $pagePath;
		$this->_basePage = file_get_contents($this->_pagePath.'basePage.html');
	}
	
	public function setContentPage($contentPage){
		$this->_currentPage = file_get_contents($this->_pagePath.$contentPage);
	}
	
	private function __replaceLanguage(){
		foreach ($GLOBALS['language'][$_SESSION['lang']] as $key=>$value){
			$this->_finalPage = str_replace('{'.$key.'}',$value,$this->_finalPage);
		}
	}
	
	private function __replaceParameters(){
		if (isset($_SESSION['parameters'])){
			foreach ($_SESSION['parameters'] as $key=>$value){
				$this->_finalPage = str_replace('{'.$key.'}',$value,$this->_finalPage);
			}
		}
	}
	
	public function getPage(){
		$this->_finalPage = str_replace ('[[page-content]]',$this->_currentPage,$this->_basePage);
		$this->_finalPage = str_replace ('[[layout-path]]',$this->_layPath,$this->_finalPage);
		self::__replaceLanguage();
		self::__replaceParameters();
		return $this->_finalPage;
	}
	
	
	
} 

?>
