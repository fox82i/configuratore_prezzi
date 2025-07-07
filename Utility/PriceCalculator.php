<?php
require_once __DIR__ . '/DataUtility.php';

class PriceCalculator {
    private $dbh;

    public function __construct(PDO $dbh) {
        $this->dbh = $dbh;
    }

    public function calculate(array $params) {
        $nome_prodotto = $params['prodotto'] ?? '';
        $lunghezza_lampada = $params['lunghezza_lampada'] ?? 0;
        $motore_led = $params['motore_led'] ?? '';
        $tipo_schermo = $params['tipo_schermo'] ?? '';
        $sistema_fissaggio = $params['sistema_fissaggio'] ?? '';
        $sistema_accensione = $params['sistema_accensione'] ?? '';
        $connettore_alimentazione = $params['connettore_alimentazione'] ?? '';
        $lunghezza_cavo = $params['lunghezza_cavo'] ?? 0;
        $giunzione_MF = $params['giunzione_MF'] ?? false;
        $qta_richiesta = $params['qta_richiesta'] ?? 1;

        $crud = [];
        $voci_costo = [];
        $costo_prodotto = 0;
        $prezzo_prodotto = 0;
        $prezzo_listino = 0;
        $costo_app = 0;

        $LU_alluminio = DataUtility::returnLunghezzaProfiloAlluminio($lunghezza_lampada, $nome_prodotto, $sistema_fissaggio, $connettore_alimentazione);
        $ingombro = DataUtility::returnIngombroTecnico($this->dbh, $nome_prodotto, $motore_led, $sistema_accensione, $connettore_alimentazione, $sistema_fissaggio);
        $LU = $lunghezza_lampada - $ingombro;
        $lunghezza_reel = DataUtility::returnLunghezzaReel($LU, $motore_led);
        $potenza_reel = DataUtility::returnPotenzaReel($lunghezza_reel, $motore_led);

        $stmt = $this->dbh->prepare("SELECT diba.*, MAX(diba.inizio_validita) as validita FROM diba WHERE diba.nome_prodotto=? GROUP BY diba.nome_prodotto,diba.codice_componente Order by diba.posizione ASC");
        $stmt->execute([$nome_prodotto]);
        $diba_prodotto = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($diba_prodotto as $row) {
            switch ($row['posizione']) {
                case '10':
                    $c = round($row['costo'] / floor(4300 / $LU_alluminio), 2);
                    $costo_prodotto += $c;
                    $voci_costo[] = ['voce_costo' => 'Verga alluminio', 'costo_singola_voce' => $c];
                    break;
                case '11':
                    $c = round(($row['costo'] / 4300) * $lunghezza_reel, 2);
                    $costo_prodotto += $c;
                    $voci_costo[] = ['voce_costo' => 'Reel plate', 'costo_singola_voce' => $c];
                    break;
                default:
                    $costo_prodotto += round($row['costo'] * $row['quantita'], 2);
                    $costo_app += round($row['costo'] * $row['quantita'], 2);
                    break;
            }
        }
        $voci_costo[] = ['voce_costo' => 'Voci fisse diba', 'costo_singola_voce' => $costo_app];
        $costo_app = 0;

        $stmt = $this->dbh->prepare("SELECT (costo_bobina_reel/lunghezza_bobina)as costo, max(data_inserimento)as validita FROM motore_led WHERE codice_motore_led=?");
        $stmt->execute([$motore_led]);
        $costo_reel = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($costo_reel) {
            $c = round($lunghezza_reel * $costo_reel[0]['costo'], 2);
            $costo_prodotto += $c;
            $voci_costo[] = ['voce_costo' => 'Reel led ', 'costo_singola_voce' => $c];
        }

        $stmt = $this->dbh->prepare("SELECT regole_schermo.*,MAX(regole_schermo.inizio_validita)as validita FROM regole_schermo WHERE regole_schermo.nome_prodotto=? AND regole_schermo.codice_schermo=? GROUP BY regole_schermo.nome_prodotto,regole_schermo.codice_articolo_schermo,regole_schermo.codice_schermo");
        $stmt->execute([$nome_prodotto, $tipo_schermo]);
        $schermo_prodotto = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($schermo_prodotto as $row) {
            $c = round($row['costo'] / floor(3000 / DataUtility::returnLunghezzaProfiloPlastico($lunghezza_lampada, $nome_prodotto, $sistema_fissaggio, $sistema_accensione)), 2);
            $costo_prodotto += $c;
            $voci_costo[] = ['voce_costo' => 'Schermo ', 'costo_singola_voce' => $c];
        }

        $stmt = $this->dbh->prepare("SELECT *,MAX(inizio_validita) as validita FROM regole_clips_reel_plate WHERE nome_prodotto=? and da<=? and a>=? GROUP BY nome_prodotto,codice_articolo_fissaggio Order by ordine ASC");
        $stmt->execute([$nome_prodotto, $lunghezza_lampada, $lunghezza_lampada]);
        $clips_reel_plate = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($clips_reel_plate as $row) {
            $c = round($row['costo'] * $row['qta'], 2);
            $costo_prodotto += $c;
            $voci_costo[] = ['voce_costo' => 'Clips fissaggio reel plate', 'costo_singola_voce' => $c];
        }

        $stmt = $this->dbh->prepare("SELECT *,MAX(inizio_validita) as validita FROM regole_piastrina_cavi WHERE nome_prodotto=? and da<=? and a>=? GROUP BY nome_prodotto,codice_articolo_fissaggio Order by ordine ASC");
        $stmt->execute([$nome_prodotto, $lunghezza_lampada, $lunghezza_lampada]);
        $piastrina_cavi = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($piastrina_cavi as $row) {
            $c = round($row['costo'] * $row['qta'], 2);
            $costo_prodotto += $c;
            $voci_costo[] = ['voce_costo' => 'Piastrina cavi', 'costo_singola_voce' => $c];
        }

        $stmt = $this->dbh->prepare("SELECT *,MAX(inizio_validita) as validita FROM regole_sistema_fissaggio WHERE nome_prodotto=? and tipo_fissaggio=? and da<=? and a>=? GROUP BY nome_prodotto,codice_articolo_fissaggio Order by ordine ASC");
        $stmt->execute([$nome_prodotto, $sistema_fissaggio, $lunghezza_lampada, $lunghezza_lampada]);
        $clips_fissaggio = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($clips_fissaggio as $row) {
            switch (true) {
                case ($nome_prodotto == 'BRASILIA' && $row['UM'] == 'MT' && $sistema_fissaggio == 2):
                    $c = round(($row['costo'] * $LU_alluminio * $row['qta']) / 1000, 2);
                    break;
                case ($nome_prodotto == 'SKYLINE' && $row['UM'] == 'MT' && $sistema_fissaggio == 2):
                    $c = round(($LU_alluminio) * ($row['costo'] * $row['qta']) / 1000, 2);
                    break;
                case ($nome_prodotto == 'BORNEO' && $row['UM'] == 'MT' && ($sistema_fissaggio == 1 || $sistema_fissaggio == 3)):
                    $c = round(($LU_alluminio) * ($row['costo'] * $row['qta']) / 1000, 2);
                    break;
                default:
                    $c = round($row['costo'] * $row['qta'], 2);
            }
            $costo_prodotto += $c;
            $costo_app += $c;
        }
        $voci_costo[] = ['voce_costo' => 'Sistema di fissaggio', 'costo_singola_voce' => $costo_app];
        $costo_app = 0;

        $stmt = $this->dbh->prepare("SELECT * FROM sistemi_accensione WHERE id_accensione=?");
        $stmt->execute([$sistema_accensione]);
        $sistema_di_accensione = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($sistema_di_accensione) {
            $costo_prodotto += $sistema_di_accensione[0]['costo'];
            $voci_costo[] = ['voce_costo' => 'Sistema accensione', 'costo_singola_voce' => $sistema_di_accensione[0]['costo']];
        }

        $stmt = $this->dbh->prepare("SELECT costo,lunghezza_cavo FROM connettore_alimentazione WHERE id_connettore=?");
        $stmt->execute([$connettore_alimentazione]);
        $tipo_connettore = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($sistema_accensione == 1) {
            $costo_prodotto += $tipo_connettore[0]['costo'];
            $voci_costo[] = ['voce_costo' => 'Connettore', 'costo_singola_voce' => $tipo_connettore[0]['costo']];
        } else {
            switch ($connettore_alimentazione) {
                case '1':
                    break;
                case '2':
                    $costo_prodotto += 1.14;
                    $voci_costo[] = ['voce_costo' => 'Connettore', 'costo_singola_voce' => 1.14];
                    break;
                case '3':
                    $costo_prodotto += $tipo_connettore[0]['costo'];
                    $voci_costo[] = ['voce_costo' => 'Connettore', 'costo_singola_voce' => $tipo_connettore[0]['costo']];
                    break;
                case '4':
                    $costo_prodotto += 1.64;
                    $voci_costo[] = ['voce_costo' => 'Connettore', 'costo_singola_voce' => 1.64];
                    break;
            }
        }

        if ($lunghezza_cavo != $tipo_connettore[0]['lunghezza_cavo']) {
            if ($lunghezza_cavo < $tipo_connettore[0]['lunghezza_cavo']) {
                $stmt = $this->dbh->prepare("SELECT costo FROM regole_cavo_bipolare WHERE classe='MINORE_STD'");
                $stmt->execute();
                $costo_cavo = $stmt->fetchAll(PDO::FETCH_ASSOC);
                $costo_prodotto += $costo_cavo[0]['costo'];
                $voci_costo[] = ['voce_costo' => 'Cavo connessione', 'costo_singola_voce' => $costo_cavo[0]['costo']];
            } else {
                $stmt = $this->dbh->prepare("SELECT costo FROM regole_cavo_bipolare WHERE classe='MAGGIORE_STD'");
                $stmt->execute();
                $costo_cavo = $stmt->fetchAll(PDO::FETCH_ASSOC);
                $val = round((($lunghezza_cavo - $tipo_connettore[0]['lunghezza_cavo']) * $costo_cavo[0]['costo']) / 1000, 2);
                $costo_prodotto += $val;
                $voci_costo[] = ['voce_costo' => 'Cavo connessione', 'costo_singola_voce' => $val];
            }
        }

        $stmt = $this->dbh->prepare("SELECT * FROM (SELECT *,MAX(inizio_validita) as maxdata FROM regole_imballi WHERE da<=? and a >=? GROUP BY costo) as tb1 WHERE inizio_validita = maxdata");
        $stmt->execute([$lunghezza_lampada, $lunghezza_lampada]);
        $tipo_imballo = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $costo_imballaggio = 0;
        foreach ($tipo_imballo as $row) {
            $costo_imballaggio += round($row['costo'] * $row['quantita'], 2);
        }
        if ($lunghezza_lampada > 1540) {
            $val = round(($costo_imballaggio * $lunghezza_lampada) / 1000, 2);
            $costo_prodotto += $val;
            $voci_costo[] = ['voce_costo' => 'Imballo', 'costo_singola_voce' => $val];
        } else {
            $costo_prodotto += $costo_imballaggio;
            $voci_costo[] = ['voce_costo' => 'Imballo', 'costo_singola_voce' => $costo_imballaggio];
        }

        if ($giunzione_MF === 'true' || $giunzione_MF === true) {
            $costo_prodotto += 0.5;
            $voci_costo[] = ['voce_costo' => 'Giunzione_MF', 'costo_singola_voce' => 0.5];
        }

        $stmt = $this->dbh->prepare("SELECT SUM(costo) as costo_lavorazione FROM costo_assemblaggio_lampada WHERE ? >= da and ? <= a AND nome_prodotto=?");
        $stmt->execute([$lunghezza_lampada, $lunghezza_lampada, $nome_prodotto]);
        $lavorazione = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($lavorazione) {
            $val = round($lavorazione[0]['costo_lavorazione'], 2);
            $costo_prodotto += $val;
            $voci_costo[] = ['voce_costo' => 'Lavorazione', 'costo_singola_voce' => $val];
        }

        $stmt = $this->dbh->prepare("SELECT MOQ FROM moq WHERE ? >= da and ? <= a");
        $stmt->execute([$qta_richiesta, $qta_richiesta]);
        $sovraprezzo = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($sovraprezzo) {
            $prezzo_prodotto = $costo_prodotto + $sovraprezzo[0]['MOQ'];
            $voci_costo[] = ['voce_costo' => 'MOQ', 'costo_singola_voce' => $sovraprezzo[0]['MOQ']];
        } else {
            $prezzo_prodotto = $costo_prodotto;
        }

        $stmt = $this->dbh->prepare("SELECT rincaro FROM rincaro_prodotto WHERE nome_prodotto=? AND id_accensione=? AND ? >= da and ? <= a");
        $stmt->execute([$nome_prodotto, $sistema_accensione, $lunghezza_lampada, $lunghezza_lampada]);
        $rincaro_effettivo = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($rincaro_effettivo) {
            $prezzo_listino = round($prezzo_prodotto * $rincaro_effettivo[0]['rincaro'], 2);
        }

        $crud['prezzo'] = $prezzo_prodotto;
        $crud['preventivo'] = $prezzo_prodotto * $qta_richiesta;
        $crud['costo'] = $costo_prodotto;
        $crud['potenza_reel'] = $potenza_reel;
        $crud['lunghezza_reel'] = $lunghezza_reel;
        $crud['descrizione_aggiuntiva'] = '';
        $crud['nome_prodotto'] = $nome_prodotto;
        $crud['prezzo_listino'] = $prezzo_listino;
        $crud['dati_singoli'] = $voci_costo;

        return ['rows' => $crud];
    }
}
?>
