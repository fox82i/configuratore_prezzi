<?php
require_once(__DIR__.'/../config/dbconfig.inc.php');
require_once(__DIR__.'/data_utility.php');

function calcolaPrezzo($params){
    $dbh = dbConn::getConnection();

    $crud = array();
    $voci_costo = array();
    $costo_prodotto = 0;
    $lunghezza_reel = 0;

    $nome_prodotto = $params['prodotto'];
    $lunghezza_lampada = $params['lunghezza_lampada'];
    $motore_led = $params['motore_led'];
    $tipo_schermo = $params['tipo_schermo'];
    $sistema_fissaggio = $params['sistema_fissaggio'];
    $sistema_accensione = $params['sistema_accensione'];
    $connettore_alimentazione = $params['connettore_alimentazione'];
    $lunghezza_cavo = $params['lunghezza_cavo'];
    $giunzione_MF = $params['giunzione_MF'];
    $qta_richiesta = $params['qta_richiesta'];
    $prezzo_prodotto = 0;
    $prezzo_listino = 0;
    $costo_app = 0;

    // lunghezza reale della verga di alluminio da tagliare
    $LU_alluminio = return_lunghezza_profilo_alluminio($lunghezza_lampada, $nome_prodotto, $sistema_fissaggio, $connettore_alimentazione);

    // calcolo lunghezza di taglio reel e potenza
    $ingombro = return_ingombro_tecnico($dbh, $nome_prodotto, $motore_led, $sistema_accensione, $connettore_alimentazione, $sistema_fissaggio);
    $LU = $lunghezza_lampada - $ingombro;
    $lunghezza_reel = return_lunghezza_reel($LU, $motore_led);
    $potenza_reel = return_potenza_reel($lunghezza_reel, $motore_led);

    // DIBA
    $diba = $dbh->query("     SELECT diba.*, MAX(diba.inizio_validita) as validita
                                        FROM diba
                                        WHERE diba.nome_prodotto='".$nome_prodotto."'
                                        GROUP BY diba.nome_prodotto,diba.codice_componente
                                        Order by diba.posizione ASC
                                ");
    $diba_prodotto = $diba->fetchAll(PDO::FETCH_ASSOC);
    foreach ($diba_prodotto as $row) {
        switch ($row['posizione']){
            case '10':
                $costo_prodotto += round($row['costo']/floor(4300/$LU_alluminio),2);
                $voci_costo[] = array('voce_costo'=>"Verga alluminio",'costo_singola_voce'=>round($row['costo']/floor(4300/$LU_alluminio),2));
                break;
            case '11':
                $costo_prodotto += round(($row['costo']/4300)*$lunghezza_reel,2);
                $voci_costo[] = array('voce_costo'=>"Reel plate",'costo_singola_voce'=>round(($row['costo']/4300)*$lunghezza_reel,2));
                break;
            default:
                $costo_prodotto += round($row['costo']*$row['quantita'],2);
                $costo_app += round($row['costo']*$row['quantita'],2);
                break;
        }
    }
    $voci_costo[] = array('voce_costo'=>"Voci fisse diba",'costo_singola_voce'=>$costo_app);
    $costo_app = 0;

    // REEL
    $reel = $dbh->query(" SELECT (costo_bobina_reel/lunghezza_bobina)as costo,max(data_inserimento)as validita
                                                FROM motore_led
                                                WHERE codice_motore_led='".$motore_led."'
                                ");
    $costo_reel = $reel->fetchAll(PDO::FETCH_ASSOC);
    $costo_prodotto += round($lunghezza_reel*$costo_reel[0]['costo'],2);
    $voci_costo[] = array('voce_costo'=>"Reel led ",'costo_singola_voce'=>round($lunghezza_reel*$costo_reel[0]['costo'],2));

    // SCHERMO
    $schermo = $dbh->query("  SELECT  regole_schermo.*,MAX(regole_schermo.inizio_validita)as validita
                                                        FROM    regole_schermo
                                                        WHERE   regole_schermo.nome_prodotto='".$nome_prodotto."'
                                                                AND regole_schermo.codice_schermo='".$tipo_schermo."'
                                                        GROUP BY regole_schermo.nome_prodotto,regole_schermo.codice_articolo_schermo,regole_schermo.codice_schermo
                                        ");
    $schermo_prodotto = $schermo->fetchAll(PDO::FETCH_ASSOC);
    foreach ($schermo_prodotto as $row) {
        $costo_prodotto += round($row['costo']/floor(3000/return_lunghezza_profilo_plastico($lunghezza_lampada,$nome_prodotto,$sistema_fissaggio,$sistema_accensione)),2);
        $voci_costo[] = array('voce_costo'=>"Schermo ",'costo_singola_voce'=>round($row['costo']/floor(3000/return_lunghezza_profilo_plastico($lunghezza_lampada,$nome_prodotto,$sistema_fissaggio,$sistema_accensione)),2));
    }

    // CLIPS FISSAGGIO REEL PLATE
    $clips = $dbh->query(" SELECT *,MAX(inizio_validita) as validita
                                                fROM regole_clips_reel_plate
                                                WHERE nome_prodotto='".$nome_prodotto."'
                                                 and da<='".$lunghezza_lampada."' and a>='".$lunghezza_lampada."'
                                                GROUP BY nome_prodotto,codice_articolo_fissaggio
                                                Order by ordine ASC
                                        ");
    $clips_reel_plate = $clips->fetchAll(PDO::FETCH_ASSOC);
    if (count($clips_reel_plate)>0){
        foreach ($clips_reel_plate as $row) {
            $costo_prodotto += round($row['costo']*$row['qta'],2);
            $voci_costo[] = array('voce_costo'=>"Clips fissaggio reel plate",'costo_singola_voce'=>round($row['costo']*$row['qta'],2));
        }
    }

    // PIASTRINA CAVI
    $piastrina = $dbh->query("SELECT *,MAX(inizio_validita) as validita
                                                        FROM regole_piastrina_cavi
                                                        WHERE nome_prodotto='".$nome_prodotto."'
                                                                and da<='".$lunghezza_lampada."' and a>='".$lunghezza_lampada."'
                                                        GROUP BY nome_prodotto,codice_articolo_fissaggio
                                                        Order by ordine ASC
                                                ");
    $piastrina_cavi = $piastrina->fetchAll(PDO::FETCH_ASSOC);
    if (count($piastrina_cavi)>0){
        foreach ($piastrina_cavi as $row) {
            $costo_prodotto += round($row['costo']*$row['qta'],2);
            $voci_costo[] = array('voce_costo'=>"Piastrina cavi",'costo_singola_voce'=>round($row['costo']*$row['qta'],2));
        }
    }

    // SISTEMA DI FISSAGGIO
    $clips = $dbh->query(" SELECT *,MAX(inizio_validita) as validita
                                                fROM regole_sistema_fissaggio
                                                WHERE nome_prodotto='".$nome_prodotto."'
                                                 and tipo_fissaggio='".$sistema_fissaggio."'
                                                 and da<='".$lunghezza_lampada."' and a>='".$lunghezza_lampada."'
                                                GROUP BY nome_prodotto,codice_articolo_fissaggio
                                                Order by ordine ASC
                                        ");
    $clips_fissaggio = $clips->fetchAll(PDO::FETCH_ASSOC);
    foreach ($clips_fissaggio as $row) {
        switch (true) {
            case ($nome_prodotto=="BRASILIA" && $row['UM']=='MT' && $sistema_fissaggio==2):
                $costo_prodotto += round(($row['costo']*$LU_alluminio*$row['qta'])/1000,2);
                $costo_app += round(($row['costo']*$LU_alluminio*$row['qta'])/1000,2);
                break;
            case ($nome_prodotto=="SKYLINE" && $row['UM']=='MT' && $sistema_fissaggio==2):
                $costo_prodotto += round(($LU_alluminio)*($row['costo']*$row['qta'])/1000,2);
                $costo_app += round(($LU_alluminio)*($row['costo']*$row['qta'])/1000,2);
                break;
            case ($nome_prodotto=="BORNEO" && $row['UM']=='MT' && ($sistema_fissaggio==1 || $sistema_fissaggio==3)):
                $costo_prodotto += round(($LU_alluminio)*($row['costo']*$row['qta'])/1000,2);
                $costo_app += round(($LU_alluminio)*($row['costo']*$row['qta'])/1000,2);
                break;
            default:
                $costo_prodotto += round($row['costo']*$row['qta'],2);
                $costo_app += round($row['costo']*$row['qta'],2);
                break;
        }
    }
    $voci_costo[] = array('voce_costo'=>"Sistema di fissaggio",'costo_singola_voce'=>$costo_app);
    $costo_app = 0;

    // SISTEMA ACCENSIONE
    $accensione = $dbh->query("       SELECT *
                                                                fROM sistemi_accensione
                                                                WHERE id_accensione='".$sistema_accensione."'
                                        ");
    $sistema_di_accensione = $accensione->fetchAll(PDO::FETCH_ASSOC);
    $costo_prodotto += $sistema_di_accensione[0]['costo'];
    $voci_costo[] = array('voce_costo'=>"Sistema accensione",'costo_singola_voce'=>$sistema_di_accensione[0]['costo']);

    // CONNETTORE
    $connettore = $dbh->query(" SELECT costo,lunghezza_cavo
                                                                  FROM connettore_alimentazione
                                                                  WHERE id_connettore='".$connettore_alimentazione."';");
    $tipo_connettore = $connettore->fetchAll(PDO::FETCH_ASSOC);
    if($sistema_accensione==1){
        $costo_prodotto += $tipo_connettore[0]['costo'];
        $voci_costo[] = array('voce_costo'=>"Connettore",'costo_singola_voce'=>$tipo_connettore[0]['costo']);
    }else{
        switch ($connettore_alimentazione) {
            case '1':
                $costo_prodotto += 0;
                break;
            case '2':
                $costo_prodotto += 1.14;
                $voci_costo[] = array('voce_costo'=>"Connettore",'costo_singola_voce'=>1.14);
                break;
            case '3':
                $costo_prodotto += $tipo_connettore[0]['costo'];
                $voci_costo[] = array('voce_costo'=>"Connettore",'costo_singola_voce'=>$tipo_connettore[0]['costo']);
                break;
            case '4':
                $costo_prodotto += 1.64;
                $voci_costo[] = array('voce_costo'=>"Connettore",'costo_singola_voce'=>1.64);
                break;
        }
    }

    // CAVO CONNESSIONE ALIMENTAZIONE PERSONALIZZATO
    if ($lunghezza_cavo <> $tipo_connettore[0]['lunghezza_cavo']){
        switch (true) {
            case ($lunghezza_cavo < $tipo_connettore[0]['lunghezza_cavo']):
                $sql = $dbh->query("      SELECT costo
                                                                        FROM regole_cavo_bipolare
                                                                        WHERE classe='MINORE_STD'
                                                                ");
                $costo_cavo = $sql->fetchAll(PDO::FETCH_ASSOC);
                $costo_prodotto += $costo_cavo[0]['costo'];
                $voci_costo[] = array('voce_costo'=>"Cavo connessione",'costo_singola_voce'=>$costo_cavo[0]['costo']);
                break;
            case ($lunghezza_cavo > $tipo_connettore[0]['lunghezza_cavo']):
                $sql = $dbh->query("      SELECT costo
                                                                        FROM regole_cavo_bipolare
                                                                        WHERE classe='MAGGIORE_STD'
                                                                ");
                $costo_cavo = $sql->fetchAll(PDO::FETCH_ASSOC);
                $costo_prodotto += Round((($lunghezza_cavo-$tipo_connettore[0]['lunghezza_cavo'])* $costo_cavo[0]['costo'])/1000,2);
                $voci_costo[] = array('voce_costo'=>"Cavo connessione",'costo_singola_voce'=>Round((($lunghezza_cavo-$tipo_connettore[0]['lunghezza_cavo'])* $costo_cavo[0]['costo'])/1000,2));
        }
    }

    // IMBALLAGGIO
    $imballo = $dbh->query("  SELECT *
                                                        FROM (  SELECT *,MAX(inizio_validita) as maxdata
                                                                        FROM regole_imballi
                                                                        WHERE da<=$lunghezza_lampada and a >=$lunghezza_lampada GROUP BY costo)as tb1
                                                        WHERE inizio_validita = maxdata ;
                                                ");
    $tipo_imballo = $imballo->fetchAll(PDO::FETCH_ASSOC);
    $costo_imballaggio = 0;
    foreach ($tipo_imballo as $row) {
        $costo_imballaggio += round($row['costo']*$row['quantita'],2);
    }
    if ($lunghezza_lampada>1540){
        $costo_prodotto += Round(($costo_imballaggio*$lunghezza_lampada)/1000,2);
        $voci_costo[] = array('voce_costo'=>"Imballo",'costo_singola_voce'=>Round(($costo_imballaggio*$lunghezza_lampada)/1000,2));
    }else{
        $costo_prodotto += $costo_imballaggio;
        $voci_costo[] = array('voce_costo'=>"Imballo",'costo_singola_voce'=>$costo_imballaggio);
    }

    // LAVORAZIONE
    if ($giunzione_MF=='true'){
        $costo_prodotto += 0.5;
        $voci_costo[] = array('voce_costo'=>"Giunzione_MF",'costo_singola_voce'=>0.5);
    }
    $lavorazione = $dbh->query("      SELECT  SUM(costo) as costo_lavorazione
                                                                FROM    costo_assemblaggio_lampada
                                                                WHERE '$lunghezza_lampada'>=da and '$lunghezza_lampada'<=a
                                                                AND nome_prodotto='".$nome_prodotto."'
                                        ");
    $lavorazione_assemblaggio = $lavorazione->fetchAll(PDO::FETCH_ASSOC);
    $costo_prodotto += Round($lavorazione_assemblaggio[0]['costo_lavorazione'],2);
    $voci_costo[] = array('voce_costo'=>"Lavorazione",'costo_singola_voce'=>Round($lavorazione_assemblaggio[0]['costo_lavorazione'],2));

    // MOQ
    $moq = $dbh->query("  SELECT MOQ
                                                from moq
                                                WHERE '$qta_richiesta' >= da and '$qta_richiesta'<=a
                                ");
    $sovraprezzo = $moq->fetchAll(PDO::FETCH_ASSOC);
    $prezzo_prodotto = $costo_prodotto + $sovraprezzo[0]['MOQ'];
    $voci_costo[] = array('voce_costo'=>"MOQ",'costo_singola_voce'=>$sovraprezzo[0]['MOQ']);

    // rincaro
    $rincaro = $dbh->query(" SELECT   rincaro
                                                        FROM    rincaro_prodotto
                                                        WHERE   nome_prodotto='".$nome_prodotto."'
                                                        AND     id_accensione=".$sistema_accensione.
                                                        " AND     '$lunghezza_lampada'>=da and '$lunghezza_lampada'<=a
                                                ");
    $rincaro_effettivo = $rincaro->fetchAll(PDO::FETCH_ASSOC);
    if (count($rincaro_effettivo)>0){
        $prezzo_listino = Round($prezzo_prodotto*$rincaro_effettivo[0]['rincaro'],2);
    }

    $crud["prezzo"] = $prezzo_prodotto;
    $crud["preventivo"] = $prezzo_prodotto*$qta_richiesta ;
    $crud["costo"] = $costo_prodotto;
    $crud["potenza_reel"] = $potenza_reel;
    $crud["lunghezza_reel"] = $lunghezza_reel;
    $crud["descrizione_aggiuntiva"] = "";
    $crud["nome_prodotto"] = $nome_prodotto;
    $crud["prezzo_listino"] = $prezzo_listino;
    $crud["dati_singoli"] = $voci_costo;

    return $crud;
}
?>
