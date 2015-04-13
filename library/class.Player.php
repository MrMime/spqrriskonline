<?php


class Player
{
	
	private $_idUser;
	private $_userName;
	private $_userPassword;
	private $_userRank;
	private $_userStatsPlayedGames;
	private $_userStatsWonGames;
	private $_userStatsLostGames;
	
	function __construct($data = null){
		if (!is_null($data)) {
			$this->_idUser 			=	$data['id_user'];
			$this->_userName 		= 	$data['user_name'];
			$this->_userPassword 	= 	$data['user_password'];
			$this->_userRank		= 	$data['user_rank'];
			$this->_userStatsPlayedGames 	= $data['user_stats_played_games'];
			$this->_userStatsWonGames 		= $data['user_stats_won_games'];
			$this->_userStatsLostGames 		= $data['user_stats_lost_games'];
		}
	}
	
	public function getUserName(){
		return $this->_userName;
	}
	
	public function getIdUser(){
		return $this->_idUser;
	}
	
	
}

?>