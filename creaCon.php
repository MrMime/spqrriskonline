<?php
 /*
  $con[1] = array(100,200,300,400);
  $con[2] = array(400,500,600,700,800);
  $con[3] = array(800,900,1000);
  $con[4] = array(900,1000,1100,1200,4200,4500,600);
  $con[5] = array(600,4500,4300,4400,3900,4200);
  $con[6] = array(4000,4300,4200,4100,1200);
  $con[7] = array(1200,1100,1300,4100);
  $con[8] = array(1300,2700,2800,2900,4000,4100);
  $con[9] = array(3900,4000,3600,2900);
  $con[10] = array(1300,1400,1500,1700,2000,2400,2600,2700);
  $con[11] = array(2600,2400,2500,2700,2800,3000,3100);
  $con[12] = array(3300,3200,3100,2500,2200,2100);
  
  $sql = "";
  foreach ($con as $seaCode=>$territory){
	foreach ($territory as $idLocation){
		foreach ($con[$seaCode] as $brother){
			if ($brother == $idLocation) continue;
			$sql .= "INSERT INTO spq_risk_location_connection VALUES (".$idLocation.",".$brother.",2,".$seaCode.");\n";
		}
	}
  }
  
  echo nl2br($sql);
  */


?>
