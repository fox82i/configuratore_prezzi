<?php
	//restituisce i primi $len caratteri di $str
	function left($str,$len){
        return substr($str, 0, $len);
	}
	
	//restituisce gli ultimi $len caratteri di $str
	function right($str,$len){
        $len=$len*-1;
        return substr($str, $len);
	}

	function elimina_Ultimo_carattere($stringa){
		return substr($stringa, 0, strlen($stringa)-1);
	}
 
 	function return_columns_table($table,$dbh){
 		

		$columns=array();

 		$rs = $dbh->query("SELECT * FROM ".$table." LIMIT 0");
		for ($i = 0; $i < $rs->columnCount(); $i++) {
   			 $col = $rs->getColumnMeta($i);
   			 $columns[] = $col['name'];
		}
		return $columns;
 	}
    
    # da capire se in futuro mettere anche il tipo di connettore. 
    # è stato messo un GROUP BY altrimenti il risultato veniva sdoppiato (appunto perchè manca il tipo connettore)
 	function return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,$sistema_accensione,$connettore,$sistema_fissaggio){

 		$sql=$dbh->query("	SELECT  ingombro_tecnico
 							FROM 	prodotto_lineare_motore_led_accensione
 							WHERE 	prodotto_lineare='".$nome_prodotto."'
 								AND motore_led='".$motore_led."'
 								AND id_sistema_accensione='".$sistema_accensione."'
 								AND id_sistema_fissaggio='".$sistema_fissaggio."'
 								AND id_connettore='".$connettore."'
 							 GROUP BY ingombro_tecnico
					 ");

		$sql->execute();
		$ingombro=$sql->fetchAll(PDO::FETCH_ASSOC);

		if (count($ingombro)==1){
			return $ingombro[0]['ingombro_tecnico'];
		}

 	}

 	function return_lunghezza_reel($LU,$motore_led){
 		switch ($motore_led) {
 			case 'G': #72 led/mt 12Vdc
 				return floor($LU/41.7)*41.7;
 				break;
 			case 'N': #72 led/mt 24Vdc
 				return floor($LU/83.3)*83.3;
 				break;
 			case 'C': #108 led/mt 12Vdc
 				return floor($LU/27.8)*27.8;
 				break;
 			case 'M': #108 led/mt 24Vdc
 				return floor($LU/55.6)*55.6;
 				break;
 			case 'E': #156 led/mt 12Vdc
 				return floor($LU/19.2)*19.2;
 				break;
 			case 'I': #156 led/mt 24Vdc
 				return floor($LU/38.5)*38.5;
 				break;
 			case 'D': #60 led/mt 12Vdc 5050
 				return floor($LU/50)*50;
 				break;
 			case 'F': #120/120 led/mt Emotion 12Vdc
 				return floor($LU/25)*25;
 				break;
 		}
 	}

 	function return_potenza_reel($LU_reel,$motore_led){

 		switch ($motore_led) {
 			case 'G': #72 led/mt 12Vdc
 				return Round($LU_reel*0.0078,1);
 				break;
 			case 'N': #72 led/mt 24Vdc
 				return Round($LU_reel*0.0078,1);
 				break;
 			case 'C': #108 led/mt 12Vdc
 				return Round($LU_reel*0.0117,1);
 				break;
 			case 'M': #108 led/mt 24Vdc
 				return Round($LU_reel*0.0117,1);
 				break;
 			case 'E': #156 led/mt 12Vdc
 				return Round($LU_reel*0.0169,1);
 				break;
 			case 'I': #156 led/mt 24Vdc
 				return Round($LU_reel*0.0169,1);
 				break;
 			case 'D': #60 led/mt 12Vdc 5050
 				return Round($LU_reel*0.0144,1);
 				break;
 			case 'F': #120/120 led/mt Emotion 12Vdc
 				return Round($LU_reel*0.0155,1);
 				break;
 		}
 	}

 	function return_lunghezza_profilo_alluminio($lunghezza_lampada,$nome_prodotto,$tipo_fissaggio,$tipo_connettore){
 		$app=0;
 		switch ($nome_prodotto){
 			case 'BALI':
 				$app=4;
 				break;
 			case 'BRASILIA':
 				switch ($tipo_fissaggio) {
 					case '1':#LEGNO
 						$app=24;
 						break;
 					case '2':#VETRO
 						$app=16;
 						break;
 					case '3':#METALLO
 						$app=32;
 						break; 					
 				} 				 				
 				break;
 			case 'DERBY':
 				$app=8;
 				break;
 			case 'GENEVE':
 				$app=4;
 				break;
 			case 'LEDO':
 				$app=13;
 				break;
 			case 'LUGANO':
 				$app=4;
 				break;
 			case 'MALINDI':
 				$app=16;
 				break;
 			case 'MALINDI-in':
 				$app=4;
 				break;
 			case 'MANILA':
 				$app=16;
 				break;
 			case 'MISKA':
 				$app=0;
 				break;
 			case 'PERTH':
 				$app=8;
 				break;
 			case 'SKYLINE':
 				switch (true){
 					case ($tipo_fissaggio=='1' && $tipo_connettore<>'3'):#LEGNO
 						$app=22;
 						break;
 					case ($tipo_fissaggio=='2' && $tipo_connettore<>'3'):#VETRO
 						$app=12;
 						break;
 					case ($tipo_fissaggio=='1' && $tipo_connettore<>'3'):#METALLO
 						$app=30;
 						break; 					
 					case ($tipo_connettore==3):
 						$app=32;
 						break; 					 					
 				} 				
 				break;
 			case 'TIFANY':
 				$app=16;
 				break;
 			case 'VENICE':
 				$app=18;
 				break;
 			case 'BORNEO':
 				$app=0;
 				break;
 			
 		}
 		return ($lunghezza_lampada-$app);
 	}

 	function return_lunghezza_profilo_plastico($lunghezza_lampada,$nome_prodotto,$tipo_fissaggio,$tipo_sistema_accensione){
 		$app=0;
 		switch ($nome_prodotto) {
 			case 'LEDO': 
 				$app=13;
 				break;
 			case 'BORNEO': 
 				switch ($tipo_fissaggio) {
 					case '1':
 						$app=0;		
 						break; 					
 					case '3':
 						$app=11;
 						break;
 				}
 				
 				break;
 			case 'BRASILIA': 
 				switch ($tipo_fissaggio) {
 					case '1':
 						$app=25.5;
 						break;
 					case '2':
 						$app=17.5;
 						break;
 					case '3':
 						$app=33.5;
 						break; 					
 				} 				
 				break;
 			case 'SKYLINE': 
 				switch ($tipo_fissaggio) {
 					case '1':#LEGNO
 						$app=22;
 						break;
 					case '2':#VETRO
 						$app=12;
 						break;
 					case '3':#METALLO
 						$app=30;
 						break; 					
 				} 				
 			
 				break;
 			case 'DERBY': 
 				$app=8;
 				break;
 			case 'PERTH': 
 				$app=8;
 				break;
 			case 'LUGANO': 
 				$app=4;
 				break; 			
 			case 'GENEVE': 
 				$app=4;
 				break;
 			case 'BALI': 
 				$app=49;
 				break;
 			case 'MANILA': 
 				$app=57;
 				break;
 			case 'MALINDI': 
 				$app=0;
 				break;
 			case 'MALINDI-in': 
 				$app=0;
 				break;
 			case 'TIFANY': 
 				$app=0;
 				break;
 			case 'MISKA': 
 				$app=0;
 				break;
 			case 'VENICE':
 				switch ($tipo_sistema_accensione) {
 					case '3': //pir panasonic
 						$app=42;
 						break; 					
 					default:
 						$app=35;
 						break;
 				} 				
 				break;
 		}
 		return ($lunghezza_lampada-$app);

 	}

 	
?>