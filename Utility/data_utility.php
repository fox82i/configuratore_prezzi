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

 	function return_ingombro_tecnico($dbh,$nome_prodotto,$motore_led,$sistema_accensione,$sistema_fissaggio){

 		$sql=$dbh->query("	SELECT  ingombro_tecnico
 							FROM 	prodotto_lineare_motore_led_accensione
 							WHERE 	prodotto_lineare='".$nome_prodotto."'
 								AND motore_led='".$motore_led."'
 								AND id_sistema_accensione='".$sistema_accensione."'
 								AND id_sistema_fissaggio='".$sistema_fissaggio."'
					 ");

		$sql->execute();
		$ingombro=$sql->fetchAll(PDO::FETCH_ASSOC);

		if (count($ingombro)>0){
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

?>