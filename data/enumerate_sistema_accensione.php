<?php
 	require_once('../config/dbconfig.inc.php');

 	include ('../Utility/data_utility.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$nome_campo_portata_max='';

 	$nome_prodotto=$_REQUEST['prodotto'];
 	$motore_led=$_REQUEST['motore_led'];
 	$lunghezza_lampada=$_REQUEST['lunghezza_lampada'];
 	$sistema_fissaggio=$_REQUEST['sistema_fissaggio'];

 	#determino il vdc -- capire come farlo passare dal form
 	$sql_vdc=$dbh->query( "	SELECT VDC
 							FROM motore_led
 							WHERE codice_motore_led='".$motore_led."'
 							 AND obsoleta<>1;
 						");
 	$sql_vdc->execute();
	$tensione=$sql_vdc->fetchAll(PDO::FETCH_ASSOC);
	
	## DOPO AVER RECUPERATO IL VOLTAGGIO
	# 1. eseguo un calcolo della potenza nominale includendo gli ingombri senza elementi 
	# 2. ricerco tutti i sistemi di accensione dove la potenza per quel voltaggio è minore di quella stabilita
	# 3- visualizzo i risultati se la potenza è minore
	# 4. se la potenza è maggiore fare
	# 		- visualizzare un avviso per un cambio voltaggio, se si vuole
	# 		- se non sussiste cambio voltaggio, inculedere sempre la doppia alimentazione (sempre)

	$ingombro=return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,1,$sistema_fissaggio);
	$LU=$lunghezza_lampada-$ingombro;
	$lunghezza_reel=return_lunghezza_reel($LU,$motore_led);
	$potenza_reel=return_potenza_reel($lunghezza_reel,$motore_led);
 	
	if ($tensione[0]['VDC']=='12Vdc'){
		$nome_campo_portata_max='portata_max_12V';
	}else{
		$nome_campo_portata_max='portata_max_24V';
	}

	$sql_sistema_accensione=$dbh->query("SELECT *
										FROM (
												SELECT 	prodotto_lineare_motore_led_accensione.id_sistema_accensione,
														sistemi_accensione.descrizione,
            											prodotto_lineare_motore_led_accensione.prodotto_lineare,
            											prodotto_lineare_motore_led_accensione.motore_led,
            											sistemi_accensione.".$nome_campo_portata_max."
            
												FROM 	prodotto_lineare_motore_led_accensione,sistemi_accensione
												WHERE 		prodotto_lineare_motore_led_accensione.id_sistema_accensione=sistemi_accensione.id_accensione

												HAVING 	prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
													AND prodotto_lineare_motore_led_accensione.motore_led='".$motore_led."'	
													AND sistemi_accensione.".$nome_campo_portata_max.">=".$potenza_reel."
											UNION
												SELECT 		prodotto_lineare_motore_led_accensione.id_sistema_accensione,
															sistemi_accensione.descrizione,
												            prodotto_lineare_motore_led_accensione.prodotto_lineare,
												            prodotto_lineare_motore_led_accensione.motore_led,
												            sistemi_accensione.".$nome_campo_portata_max."
												            
												FROM 		prodotto_lineare_motore_led_accensione,sistemi_accensione
												WHERE 		prodotto_lineare_motore_led_accensione.id_sistema_accensione=sistemi_accensione.id_accensione

												HAVING   prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
												     AND 	prodotto_lineare_motore_led_accensione.motore_led='".$motore_led."'	
													AND sistemi_accensione.".$nome_campo_portata_max."=0
											)result
										ORDER BY result.id_sistema_accensione ASC
										
								");	
	$sql_sistema_accensione->execute();
	$sistemi_accensione=$sql_sistema_accensione->fetchAll(PDO::FETCH_ASSOC);

	foreach($sistemi_accensione as $row){
	
		array_push($crud, $row);  
	}  
	$results["potenza_reel"]=$potenza_reel;
	$results["rows"]=$crud;	

	echo json_encode($results);  
?>