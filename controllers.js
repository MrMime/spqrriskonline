angular.module('PlayersModule.controllers', []).
controller('playerController', function($scope) {
    $scope.playerList = [
      {
          nickName: 'MrMime',                        
          points: 12,
          cards: 1121          
      },
      {
          nickName: 'andry',                        
          points: 6,
          cards: 21
      }
    ];
});