<?php
 	require_once('../config/dbconfig.inc.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$prodotto=$_REQUEST['prodotto'];

 	$sql=$dbh->query("	SELECT 	sistemi_fissaggio.id_sistema_fissaggio, 
 								sistemi_fissaggio.descrizione_sistema_fissaggio
						FROM 	sistemi_fissaggio,prodotto_lineare_motore_led_accensione
						WHERE 	prodotto_lineare_motore_led_accensione.id_sistema_fissaggio=sistemi_fissaggio.id_sistema_fissaggio 
							AND prodotto_lineare_motore_led_accensione.prodotto_lineare='".$prodotto."' 
							
						GROUP BY sistemi_fissaggio.id_sistema_fissaggio
						ORDER BY sistemi_fissaggio.id_sistema_fissaggio ASC;
							
					 ");
	$sql->execute();
	$sistemi_fissaggio=$sql->fetchAll(PDO::FETCH_ASSOC);
	
	
	foreach($sistemi_fissaggio as $row){
	
		array_push($crud, $row);  
	}  
	
	$results["rows"]=$crud;
	

	
	echo json_encode($results);  
?>