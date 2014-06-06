<?php
 	require_once('../config/dbconfig.inc.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$motore_led=$_REQUEST['motore_led'];

 	$sql=$dbh->query("	SELECT 	tipo_luce.id_tipo_luce, 
 								CONCAT_WS(' ', tipo_luce.tipo_luce,tipo_luce.temperatura_colore_comm) as descrizione_colore 
						FROM 	motore_led_luce,tipo_luce ,motore_led
						WHERE 	motore_led_luce.id_tipo_luce=tipo_luce.id_tipo_luce 
							AND motore_led.codice_motore_led='".$motore_led."' 
							AND motore_led.codice_motore_led=motore_led_luce.motore_led
						GROUP BY tipo_luce.id_tipo_luce
						ORDER BY tipo_luce.temperatura_colore_comm ASC;
							
					 ");
	$sql->execute();
	$colori_luce=$sql->fetchAll(PDO::FETCH_ASSOC);
	
	
	foreach($colori_luce as $row){
	
		array_push($crud, $row);  
	}  
	
	$results["rows"]=$crud;
	

	
	echo json_encode($results);  
?>