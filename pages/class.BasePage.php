<?php


abstract class BasePage
{
	
	private $_htmlFileName = null;
	private $_pageContent  = null;
	
	function __construct(){
		
	}
	
	
	public abstract function makeAction($data);
		
	
}