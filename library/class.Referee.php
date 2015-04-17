<?php

require_once('class.Layout.php');

class Referee
{
	
	const CREATE_PAGE 		= "createGamePage.html";
	const LOGIN_PAGE 		= "loginPage.html";
	const ABOUT_PAGE		= "aboutPage.html";
	const CONTACT_PAGE 		= "contactPage.html";
	const CONTINUE_PAGE		= "continuePage.html";
	const STATS_PAGE		= "statsPage.html";
	
	function __construct(){
		
	}
	
	
	public function getPageFromGet($get){
		$get = $get['page'];
		
		switch($get){
			case 'about': return Referee::ABOUT_PAGE; break; 
			case 'login': return Referee::LOGIN_PAGE; break;
			case 'continue': return Referee::CONTINUE_PAGE; break;
			case 'stats': return Referee::STATS_PAGE; break;
			case 'contact': return Referee::CONTACT_PAGE; break;
			case 'new' :
			default: 
			return Referee::CREATE_PAGE;
			
		}
	}
	
	
}


?>