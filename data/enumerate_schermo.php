<?php
 	require_once('../config/dbconfig.inc.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$nome_prodotto=$_REQUEST['prodotto'];

 	$sql=$dbh->query("	SELECT 	regole_schermo.codice_schermo, 
 								schermo.descrizione_schermo
						FROM 	schermo,regole_schermo
						WHERE 	regole_schermo.nome_prodotto='".$nome_prodotto."'
							AND regole_schermo.codice_schermo=schermo.codice_schermo
						GROUP BY regole_schermo.codice_schermo
						ORDER BY schermo.descrizione_schermo ASC
							
					 ");
	$sql->execute();
	$schermo=$sql->fetchAll(PDO::FETCH_ASSOC);
	
	
	foreach($schermo as $row){
	
		array_push($crud, $row);  
	}  
	
	$results["rows"]=$crud;
	

	
	echo json_encode($results);  
?>