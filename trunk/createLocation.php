<!DOCTYPE html>
<html>
<head>
  <title>TEST</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/location.css">
  <script type="text/javascript" src="angular.min.js"></script>  
  <script type="text/javascript" src="jquery-1.5.2.js"></script>
  <script src="controllers.js"></script>
  <script src="app.js"></script>  
  
  <script>
	  var currentLocationLabel = "";
	  var currentLocationType = "";
  
	  var divPos = {};
	  var clickPos = {};
	  var offset = {}
	  $(document).mousemove(function(e){
	      var $div = $("#mappa");
	      divPos = {
	          left: e.pageX - $div.offset().left,
	          top: e.pageY - $div.offset().top
	      };	      
	      $('#coords').val(divPos.left+' X'+ divPos.top+' Y');
	  });

		  
  </script>
</head>

<?php
			include('library/class.AbstractGenericManager.php');
			include('library/class.PDODatabase.php');
			include('library/class.GameManager.php');
			include('library/class.LocationManager.php');
	
			$db = new PDFDatabase();
			$db->connect("root", "", "spq_risk", "localhost:3306");
			$GLOBALS['db'] = $db;
			
			$lManager = new LocationManager();
			$GLOBALS['locationManager'] = $lManager;
			
			
?>

<body ng-app="PlayersModule" ng-controller="playerController">
	<div style="border:1px solid black;padding-left:250px;">
	 	<div id="mappa" class="map">
			<?php
				
				$allLocation = $lManager->allBaseGameLocation();
				
				foreach ($allLocation as  $loc){
					switch($loc['location_type']){
						case 1: $css1 = 'legionary'; $css2 = 'legionaryThreeBlack'; break;
						case 2: $css1 = 'ship'; $css2 = 'shipUniqueBlack'; break;
						case 3: $css1 = 'coliseum'; $css2 = 'coliseumUniqueBlack'; break;
					}
					
										
					$css3 = $loc['location_label'];
					
					echo '<div id="'.$loc['id_location'].'" class="'.$css1.' '.$css2.' '.$css3.'" title="'.$loc['id_location'].'"></div>';
					
				}
			
			?>
<!--	 		<div class="coliseum coliseumUniqueBlack britishColiseum"></div>-->
<!--	 		<div class="legionary legionaryThreeBlack britishLegionary"></div>-->
<!--	 		<div class="ship shipUniqueBlack lugdunenseShip"></div>-->
	 	</div>
 	</div>
 	<div style="border:2px solid black;position:relative;float:left;">
		<?php
						
			$allLocation = $lManager->allBaseGameLocation();
						
			foreach ($allLocation as $loc){		
				switch($loc['location_type']){
					case 1: $color = '#009900'; break;
					case 2: $color = '#000099'; break;
					case 3: $color = '#AAAA00'; break;
				}
				echo '<p id="'.$loc['location_label'].'" align="'.$loc['location_type'].'" title="'.$loc['location_label'].'-'.$loc['id_location_group'].'" onClick="currentLocationType = this.align; currentLocationLabel = this.id;$(\'#locId\').val(currentLocationLabel);" style="cursor:pointer;color:white;background-color:'.$color.';float:left;width:40px;height:20px;border:1px solid red;text-align:center;vertical-align:top;line-height;40px;"> '.$loc['id_location'].'</p>';
			}
		
		?>	
	</div>
	<input id="locId" size="25" />
 	<input id="coords" type="text" size="20" />
	<br>
	<textarea id="click" type="text" cols="50" rows="50"></textarea>	
	<script>
		$('#mappa').click(function(e){
		clickPos = divPos;
		
		offset = {
			top : clickPos.top - ((currentLocationType == 1) ? 37:20),
			left : clickPos.left - ((currentLocationType == 1) ? 20:15)
		}
		//var legion = $('<div class="legionary" style="top:'+offset.top+'px;left='.left.'px"></div>'); 
		var css = "";
		switch(currentLocationType){
			case '1': css = 'legionaryOverBlack'; break;
			case '2': css = 'shipUniqueBlack'; break;
			case '3': css = 'coliseumUniqueBlack'; break;
		}		
		var legion = $('<div class="legionary '+css+'" style="top:'+offset.top+'px;left:'+offset.left+'px;" onClick="this.parent.removeChild(this);"></div>'); 
		
		var vall = $('#click').val();
		$('#click').val(vall+ "."+currentLocationLabel+" { top: "+offset.top+"px; left: "+offset.left+"px;} \n");
		$('#mappa').append(legion);
		
	});
	
	</script>
	
</body>
</html>