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
	
	const NEW_GAME_PAGE		= "newGamePage.html";
	
	private $_gameManager = null;
	
	function __construct(){
		
		$this->_gameManager = new GameManager();
		
	}
	
	
	public function getPageFromGet($get){
		$get = $get['page'];
		
		switch($get){
			case 'about': return Referee::ABOUT_PAGE; break; 
			case 'login': return Referee::LOGIN_PAGE; break;
			case 'continue': return Referee::CONTINUE_PAGE; break;
			case 'stats': return Referee::STATS_PAGE; break;
			case 'contact': return Referee::CONTACT_PAGE; break;
			case 'newGame': return Referee::NEW_GAME_PAGE; break;
			case 'new' :
			default: 
			return Referee::CREATE_PAGE;
			
		}
	}
	
	public function getAction($request){
		
		if (isset($request['doAction']) && $request['doAction'] == 1){
			
			switch($request['actionName']){
				case 'createGame': return $this->_gameManager->createNewGame($request['game']);  break;
				case 'continueGame':	$gameInfo = $this->_gameManager->loadGameInfo($request['game']['id_game']);
									if ($gameInfo == null){
										$_SESSION['error-message'] = $GLOBALS["language"][$_SESSION['lang']]['game_not_found'];
									}
									return $gameInfo; 
									break;
			}
			
		}
		
	} 
	
	
}


?>