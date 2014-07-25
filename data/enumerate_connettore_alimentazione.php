<?php
	require_once('../config/dbconfig.inc.php');

 	include ('../Utility/data_utility.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$nome_campo_portata_max='';
 	
 	$costo_prodotto=0;

 	$nome_prodotto=$_REQUEST['prodotto'];
 	$motore_led=$_REQUEST['motore_led'];
 	$lunghezza_lampada=$_REQUEST['lunghezza_lampada'];
 	$sistema_fissaggio=$_REQUEST['sistema_fissaggio'];
 	$sistema_accensione=$_REQUEST['sistema_accensione'];
 	$vdc=$_REQUEST['vdc'];

 	#eseguo calcolo per la lunghezza di taglio reel e sua relativa potenza in funzione delle scelti precedenti
 	$ingombro=return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,$sistema_accensione,$sistema_fissaggio);
	$LU=$lunghezza_lampada-$ingombro;
	$lunghezza_reel=return_lunghezza_reel($LU,$motore_led);
	$potenza_reel=return_potenza_reel($lunghezza_reel,$motore_led);


	if ($vdc=='12Vdc'){
		$nome_campo_portata_max='portata_max_12V';

	}else{
		$nome_campo_portata_max='portata_max_24V';
	}

	$sql_connettore_alimentazione=$dbh->query("	SELECT 	prodotto_lineare_motore_led_accensione.id_connettore,
														connettore_alimentazione.descrizione_connettore,
            											connettore_alimentazione.".$nome_campo_portata_max.",
                                                        prodotto_lineare_motore_led_accensione.prodotto_lineare,
                                                        prodotto_lineare_motore_led_accensione.motore_led,
                                                        prodotto_lineare_motore_led_accensione.id_sistema_fissaggio,
                                                        prodotto_lineare_motore_led_accensione.id_sistema_accensione,
                                                        prodotto_lineare_motore_led_accensione.giunzione_MF,
                                                        prodotto_lineare_motore_led_accensione.uscita_cavo,
                                                        connettore_alimentazione.lunghezza_cavo,
                                                        connettore_alimentazione.sdoppiabile

            
												FROM 	prodotto_lineare_motore_led_accensione,connettore_alimentazione
												WHERE 	prodotto_lineare_motore_led_accensione.id_connettore=connettore_alimentazione.id_connettore
												
												HAVING 	prodotto_lineare_motore_led_accensione.prodotto_lineare='".$nome_prodotto."'
													AND prodotto_lineare_motore_led_accensione.motore_led='".$motore_led."'	
													AND connettore_alimentazione.".$nome_campo_portata_max.">=".$potenza_reel."
													AND prodotto_lineare_motore_led_accensione.id_sistema_fissaggio='".$sistema_fissaggio."'
                                                    AND prodotto_lineare_motore_led_accensione.id_sistema_accensione='".$sistema_accensione."'
												ORDER BY    prodotto_lineare_motore_led_accensione.id_connettore asc
											
												
										
											");	
	$sql_connettore_alimentazione->execute();
	$connettore_alimentazione=$sql_connettore_alimentazione->fetchAll(PDO::FETCH_ASSOC);

	foreach($connettore_alimentazione as $row){
	
		array_push($crud, $row);  
	}  
	#$results["potenza_reel"]=$potenza_reel;
	$results["rows"]=$crud;	

	$results["potenza_reel"]=$potenza_reel;


	/*
		COSTO SEQUENZA DI SOMMA
			1. prelevo la diba del prodotto
				facccio attenzione a questo
					a. posizione 10 ha un computo costo
					b. reel plate segue il calcolo della reeel
					c. lo schermo come il punto a			
			2. sommo i costi per tutti pz per la qta e costo 
			3. esegueo le somme per le clips di fissaggio 
			4. eseguo le somme anche per il sistema di accensione dove disponibile
	*/

	$diba=$dbh->query("	SELECT diba.*, MAX(diba.inizio_validita) as validita
					FROM diba
					WHERE diba.nome_prodotto='".$nome_prodotto."'
					GROUP BY diba.nome_prodotto,diba.codice_componente
					Order by diba.posizione ASC
				");

	$diba_prodotto=$diba->fetchAll(PDO::FETCH_ASSOC);

	foreach ($diba_prodotto as $row) {
		switch ($row['posizione']){
			case '10'://verga alluminio
					$costo_prodotto=$costo_prodotto + round($row['costo']/floor(4300/$LU),2);
				break;
			case '20'://lunghezza reel plate == reel
					$costo_prodotto=$costo_prodotto + round($row['costo']*$lunghezza_reel,2);
				break;
			default:
					$costo_prodotto=$costo_prodotto + round($row['costo']*$row['quantita'],2);
				break;
		}
		
		
	}
	//CLIPS FISSAGGIO
	$clips=$dbh->query(" SELECT *,MAX(inizio_validita) as validita
						fROM regole_sistema_fissaggio
						WHERE nome_prodotto='".$nome_prodotto."'
						 and tipo_fissaggio='".$sistema_fissaggio."'
						 and da<='".$lunghezza_lampada."' and a>='".$lunghezza_lampada."'
						GROUP BY nome_prodotto,codice_articolo_fissaggio
						Order by ordine ASC
					");
	$clips_fissaggio=$clips->fetchAll(PDO::FETCH_ASSOC);	

	foreach ($clips_fissaggio as $row) {
		$costo_prodotto=$costo_prodotto+ (round($row['costo']+$row['qta'],2));
	}

	//SISTEMA ACCENSIONE
	$accensione=$dbh->query(" 	SELECT *
								fROM sistemi_accensione
								WHERE id_accensione='".$sistema_accensione."'
						 
					");
	$sistema_di_accensione=$accensione->fetchAll(PDO::FETCH_ASSOC);	

	$costo_prodotto=$costo_prodotto+$sistema_di_accensione[0]['costo'];

	$results["costo"]=$costo_prodotto;

	echo json_encode($results);



?>