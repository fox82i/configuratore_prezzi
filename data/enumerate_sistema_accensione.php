<?php
 	require_once('../config/dbconfig.inc.php');

 	include ('../Utility/data_utility.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();
 	$app=array();
	$nome_campo_portata_max='';
	$no_touch='';
	

 	$nome_prodotto=$_REQUEST['prodotto'];
 	$motore_led=$_REQUEST['motore_led'];
 	$lunghezza_lampada=$_REQUEST['lunghezza_lampada'];
 	$sistema_fissaggio=$_REQUEST['sistema_fissaggio'];
 	$tipo_schermo=$_REQUEST['tipo_schermo'];
 	$vdc=$_REQUEST['vdc'];
 	$sql="";

	## DOPO AVER RECUPERATO IL VOLTAGGIO
	# 1. eseguo un calcolo della potenza nominale includendo gli ingombri senza elementi 
	# 2. ricerco tutti i sistemi di accensione dove la potenza per quel voltaggio è minore di quella stabilita
	# 3. visualizzo i risultati se la potenza è minore
	# 4. se la potenza è maggiore fare
	# 		- visualizzare un avviso per un cambio voltaggio, se si vuole
	# 		- se non sussiste cambio voltaggio, inculedere sempre la doppia alimentazione (sempre)
	#		- se anche con la doppia alimentazione cmq la potenza nominale è superiore a quella consentita dal cavo, allora si deve cambiare misura o reel (andando su una reel più bassa)
	# 5. se viene selezionato nessun schermo, allora il sistema touch non deve apparire nella lista delle opzioni. Questo vale solo se la potenza rientra nel range, negli altri casi è già gestito

 	#ingombro nominale, in quanto calcolo la potenza della reel senza nessun sistema di accensione. In base al risultato visualizzo o meno i sistemi di accensione disponibili
 	#il connettore metto twin per la base
	$ingombro=return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,1,1,$sistema_fissaggio);
	$LU=$lunghezza_lampada-$ingombro;
	$lunghezza_reel=return_lunghezza_reel($LU,$motore_led);
	$potenza_reel=return_potenza_reel($lunghezza_reel,$motore_led);

	# pre configuro la stringa sql nel caso in cui l'utente seleziona nessun schermo. La stringa verrà messa nel caso in cui la potenza nominale non supera i 3A
	if ($tipo_schermo=='NA'){
		$no_touch="AND 	sistemi_accensione.id_accensione=1";

	}


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
			#CASO IN CUI LA POTENZA VA OLTRE IL LIMITE E NON SI PUò FARE NIENTE	
			$crud["sdoppiabile"]="errore";
			$crud["potenza_reel"]=$potenza_reel;
			$crud["errore"]="Attenzione!! Potenza rilevata:".$potenza_reel." W. Potenza superiore a quella consentita. Non è possibile sdoppiare l'alimentazione";
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
								CONCAT_WS(' ','Attenzione: ci sarà una doppia alimentazione. Se non si vuole la doppia alimentazione provare a passare ai 24V. Potenza reel nominale rilevata:".$potenza_reel."W. Potenza massima consentia',CONCAT_WS('',sistemi_accensione.".$nome_campo_portata_max.",'W')) as errore
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
					".$no_touch."
				GROUP BY prodotto_lineare_motore_led_accensione.id_sistema_accensione;";
	}

	if ($sql<>""){
		$sql_sistema_accensione=$dbh->query($sql);
		$sql_sistema_accensione->execute();
		$sistemi_accensione=$sql_sistema_accensione->fetchAll(PDO::FETCH_ASSOC);
	
		foreach($sistemi_accensione as $row){	
			array_push($crud, $row);  
		} 	 
	}
	
		$results["rows"]=$crud;		

	echo json_encode($results);  
?>