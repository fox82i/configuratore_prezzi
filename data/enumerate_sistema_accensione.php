<?php
 	require_once('../config/dbconfig.inc.php');

 	include ('../Utility/data_utility.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();
 	$app=array();
	$nome_campo_portata_max='';
	

 	$nome_prodotto=$_REQUEST['prodotto'];
 	$motore_led=$_REQUEST['motore_led'];
 	$lunghezza_lampada=$_REQUEST['lunghezza_lampada'];
 	$sistema_fissaggio=$_REQUEST['sistema_fissaggio'];
 	$vdc=$_REQUEST['vdc'];
 	$sql="";

	## DOPO AVER RECUPERATO IL VOLTAGGIO
	# 1. eseguo un calcolo della potenza nominale includendo gli ingombri senza elementi 
	# 2. ricerco tutti i sistemi di accensione dove la potenza per quel voltaggio è minore di quella stabilita
	# 3- visualizzo i risultati se la potenza è minore
	# 4. se la potenza è maggiore fare
	# 		- visualizzare un avviso per un cambio voltaggio, se si vuole
	# 		- se non sussiste cambio voltaggio, inculedere sempre la doppia alimentazione (sempre)
	#		- se anche con la doppia alimentazione cmq la potenza nominale è superiore a quella consentita dal cavo, allora si deve cambiare misura o reel (andando su una reel più bassa)

	$ingombro=return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,1,$sistema_fissaggio);
	$LU=$lunghezza_lampada-$ingombro;
	$lunghezza_reel=return_lunghezza_reel($LU,$motore_led);
	$potenza_reel=return_potenza_reel($lunghezza_reel,$motore_led);


 	#ATTRIBUISCO IL NOME DEL CAMPO IN FUNZIONE DEL VOLTAGGIO SELEZIONATO
	if ($vdc=='12Vdc'){
		$nome_campo_portata_max='portata_max_12V';
	}else{
		$nome_campo_portata_max='portata_max_24V';
	}


	$portata_W=$dbh->query(" 	SELECT sistemi_accensione.".$nome_campo_portata_max." as portata_max
								FROM sistemi_accensione
								WHERE id_accensione='1'
						");
	$portata_cavo=$portata_W->fetchAll(PDO::FETCH_ASSOC);

	/*FARE IL CONTROLLO PER LA POTENZA*/

	if ($potenza_reel>$portata_cavo[0]['portata_max']){
		#VERIFICO SE LA POSSO PROCEDERE CON LA DOPPIA ALIMENTAZIONE
		if (($potenza_reel/2)>$portata_cavo[0]['portata_max']){			
			$crud["sdoppiabile"]="errore";
			$crud["potenza_reel"]=$potenza_reel;
			$crud["errore"]="Attenzione!! potenza superiore a quella consentita";
			$sql="";

		}else{
			#CASO SDOPPIO L'ALIMENTAZIONE
			$sql="
					SELECT 		prodotto_lineare_motore_led_accensione.id_sistema_accensione,
								sistemi_accensione.descrizione,
								prodotto_lineare_motore_led_accensione.prodotto_lineare,
								prodotto_lineare_motore_led_accensione.motore_led,
								sistemi_accensione.".$nome_campo_portata_max." as portata_max,
								".$potenza_reel." as potenza_reel, 
								'SI' as sdoppiabile, 
								'Attenzione: ci sar&agrave; una doppia alimentazione. Se non si vuole la doppia alimentazione provare a passare ai 24V. <br/>Potenza reel nominale rilevata:".$potenza_reel."W' as errore
					FROM 		prodotto_lineare_motore_led_accensione,sistemi_accensione
					WHERE 		prodotto_lineare_motore_led_accensione.id_sistema_accensione=sistemi_accensione.id_accensione
					    AND   	prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
					    AND 	prodotto_lineare_motore_led_accensione.motore_led='".$motore_led."'	
						AND 	sistemi_accensione.id_accensione=1
					GROUP BY prodotto_lineare_motore_led_accensione.id_sistema_accensione
				";
		}
			
	}else{
		#caso normale
		$sql="	SELECT 	prodotto_lineare_motore_led_accensione.id_sistema_accensione,
						sistemi_accensione.descrizione,
            			prodotto_lineare_motore_led_accensione.prodotto_lineare,
            			prodotto_lineare_motore_led_accensione.motore_led,
            			sistemi_accensione.".$nome_campo_portata_max." as portata_max,
            			'".$potenza_reel."' as potenza_reel, 
            			'NO' as sdoppiabile, 
            			'Potenza nella norma' as errore
            	FROM 	prodotto_lineare_motore_led_accensione,sistemi_accensione
				WHERE 	prodotto_lineare_motore_led_accensione.id_sistema_accensione=sistemi_accensione.id_accensione
				    AND prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
					AND prodotto_lineare_motore_led_accensione.motore_led='".$motore_led."'	
					AND sistemi_accensione.".$nome_campo_portata_max.">=".$potenza_reel."
				GROUP BY prodotto_lineare_motore_led_accensione.id_sistema_accensione;";
	}
/*
	$sql_sistema_accensione=$dbh->query("SELECT *, ".$potenza_reel." as potenza_reel, 'NO' as sdoppiato, 'Potenza nella norma' as errore
										FROM (
												SELECT 	prodotto_lineare_motore_led_accensione.id_sistema_accensione,
														sistemi_accensione.descrizione,
            											prodotto_lineare_motore_led_accensione.prodotto_lineare,
            											prodotto_lineare_motore_led_accensione.motore_led,
            											sistemi_accensione.".$nome_campo_portata_max." as portata_max
            											
            
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
												            sistemi_accensione.".$nome_campo_portata_max." as portata_max
												            
												FROM 		prodotto_lineare_motore_led_accensione,sistemi_accensione
												WHERE 		prodotto_lineare_motore_led_accensione.id_sistema_accensione=sistemi_accensione.id_accensione

												HAVING   prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
												     AND 	prodotto_lineare_motore_led_accensione.motore_led='".$motore_led."'	
													AND sistemi_accensione.".$nome_campo_portata_max."=0
											)result
										ORDER BY result.id_sistema_accensione ASC
										
								");	*/
	if ($sql<>""){
		$sql_sistema_accensione=$dbh->query($sql);
		$sql_sistema_accensione->execute();
		$sistemi_accensione=$sql_sistema_accensione->fetchAll(PDO::FETCH_ASSOC);
		#if (count($sistemi_accensione)>0){

		foreach($sistemi_accensione as $row){	
			array_push($crud, $row);  
		} 	 
		/*}else{
		$crud["potenza_reel"]=$potenza_reel;
		$crud["errore"]="Attenzione!! potenza superiore a quella consentita";
		$results=$crud;
		}*/
	

	}
	
		$results["rows"]=$crud;		

	echo json_encode($results);  
?>