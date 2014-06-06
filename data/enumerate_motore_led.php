<?php
 	require_once('../config/dbconfig.inc.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();
 	$nome_prodotto=$_REQUEST['prodotto'];

 	$sql=$dbh->query("	SELECT 	concat_ws(' ', motore_led.descrizione_motore,motore_led.VDC) as descrizione,
 								motore_led.codice_motore_led,
 								motore_led.VDC
						FROM 	prodotto_lineare_motore_led_accensione, motore_led
						WHERE 	prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
						  AND 	prodotto_lineare_motore_led_accensione.motore_led=motore_led.codice_motore_led
						GROUP BY motore_led.codice_motore_led
						ORDER BY concat_ws(' ', motore_led.descrizione_motore,motore_led.VDC) DESC
							
					 ");
	$sql->execute();
	$motori_led=$sql->fetchAll(PDO::FETCH_ASSOC);
	
	
	foreach($motori_led as $row){
	
		array_push($crud, $row);  
	}  
	$results["rows"]=$crud;
	

	
	echo json_encode($results);  
?>