<?php

	require_once('../config/dbconfig.inc.php');

 	include ('../Utility/data_utility.php');


 	$dbh = dbConn::getConnection();

 	$crud=array();
 	$results=array();

 	$costo_prodotto=0;
 	$lunghezza_reel=0;

 	$nome_prodotto=$_REQUEST['prodotto'];
 	$lunghezza_lampada=$_REQUEST['lunghezza_lampada'];
 	$motore_led=$_REQUEST['motore_led'];
 	$tipo_schermo=$_REQUEST['tipo_schermo']; 
 	$sistema_fissaggio=$_REQUEST['sistema_fissaggio'];
 	$sistema_accensione=$_REQUEST['sistema_accensione'];
 	$connettore_alimentazione=$_REQUEST['connettore_alimentazione'];
 	$lunghezza_cavo=$_REQUEST['lunghezza_cavo'];
 	$giunzione_MF=$_REQUEST['giunzione_MF'];
 	$qta_richiesta=$_REQUEST['qta_richiesta'];
 		

 	#eseguo calcolo per la lunghezza di taglio reel e sua relativa potenza in funzione delle scelti precedenti
 	$ingombro=return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,$sistema_accensione,$sistema_fissaggio);
 	
 	#lunghezza lampada effettiva utile poi anche come base di partenza per la reel
	$LU=$lunghezza_lampada-$ingombro;

	$lunghezza_reel=return_lunghezza_reel($LU,$motore_led);
	$potenza_reel=return_potenza_reel($lunghezza_reel,$motore_led);

	// DIBA
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

	//SCHERMO
	$schermo=$dbh->query("	SELECT 	regole_schermo.*,MAX(regole_schermo.inizio_validita)as validita 
							FROM 	regole_schermo
							WHERE 	regole_schermo.nome_prodotto='".$nome_prodotto."'
								AND regole_schermo.codice_schermo='".$tipo_schermo."'
							GROUP BY regole_schermo.nome_prodotto,regole_schermo.codice_articolo_schermo,regole_schermo.codice_schermo
					");
	$schermo_prodotto=$schermo->fetchAll(PDO::FETCH_ASSOC);

	foreach ($schermo_prodotto as $row) {
		$costo_prodotto=$costo_prodotto + round($row['costo']/floor(3000/return_lunghezza_profilo_plastico($lunghezza_lampada,$nome_prodotto,$sistema_fissaggio)),2);
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

	$app="";
	// LAVORAZIONE
	if ($giunzione_MF==true){
		$app=" OR tipo_lavorazione='GIUNZIONE MF'";
	}
	$lavorazione=$dbh->query(" 	SELECT 	SUM(costo) as costo_lavorazione
								FROM  	costo_assemblaggio_lampada
								WHERE (		tipo_lavorazione='ASSEMBLAGGIO' 
								       OR 	tipo_lavorazione='TAGLIO SCHERMO' 
								       OR 	tipo_lavorazione='TAGLIO VERGA' 
								       OR 	tipo_lavorazione='TAGLIO REELPLATE'
								       ".$app.")
								AND '".$lunghezza_lampada."'>=da and '".$lunghezza_lampada."'<=a
						 
					");
	$lavorazione_assemblaggio=$lavorazione->fetchAll(PDO::FETCH_ASSOC);	
	$costo_prodotto=$costo_prodotto+$lavorazione_assemblaggio[0]['costo_lavorazione'];

	//CONNETTORE
	$connettore=$dbh->query(" SELECT costo
							  FROM connettore_alimentazione
							  WHERE id_connettore='".$connettore_alimentazione."';");

	$tipo_connettore=$connettore->fetchAll(PDO::FETCH_ASSOC);
	$costo_prodotto=$costo_prodotto+$tipo_connettore[0]['costo'];

	//IMBALLAGGIO

	$imballo=$dbh->query(" SELECT costo
							FROM regole_imballi
							WHERE ".$lunghezza_lampada.">=da and a <=".$lunghezza_lampada.";

						");
	$tipo_imballo=$imballo->fetchAll(PDO::FETCH_ASSOC);
	$costo_prodotto=$costo_prodotto+$tipo_imballo[0]['costo'];

	//MOQ
	$moq=$dbh->query("  SELECT MOQ
						from moq
						WHERE '".$qta_richiesta."' >= da and '".$qta_richiesta."'<=a
				");
	$sovraprezzo=$moq->fetchAll(PDO::FETCH_ASSOC);	


	$prezzo_prodotto=$costo_prodotto + $sovraprezzo[0]['MOQ'];
	

	$crud["prezzo"]=$prezzo_prodotto;
	$crud["preventivo"]=$prezzo_prodotto*$qta_richiesta ;
	$crud["costo"]=$costo_prodotto;
	$crud["potenza_reel"] = $potenza_reel;
	$crud["lunghezza_reel"]= $lunghezza_reel;
	$crud["descrizione_aggiuntiva"]="";
	$crud["nome_prodotto"]=$nome_prodotto;
	

	$results["rows"]=$crud;

	echo json_encode($results);


?>