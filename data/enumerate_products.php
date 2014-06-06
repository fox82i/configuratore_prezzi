<?php
 	require_once('../config/dbconfig.inc.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$sql=$dbh->query("	SELECT 		nome_prodotto as prodotto,
 									lunghezza_minima_accettata,
 									lunghezza_massima_accettata
						FROM 		prodotti_lineari
						WHERE 		obsoleta='0'
						ORDER BY 	nome_prodotto ASC
						 
							
					 ");
	$sql->execute();
	$prodotti=$sql->fetchAll(PDO::FETCH_ASSOC);
	
	
	foreach($prodotti as $row){
	
		array_push($crud, $row);  
	}  
	$results["rows"]=$crud;
	

	
	echo json_encode($results);  
?>