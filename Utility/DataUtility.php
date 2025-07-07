<?php
class DataUtility {
    public static function left($str, $len) {
        return substr($str, 0, $len);
    }

    public static function right($str, $len) {
        return substr($str, -$len);
    }

    public static function eliminaUltimoCarattere($stringa) {
        return substr($stringa, 0, strlen($stringa) - 1);
    }

    public static function returnColumnsTable($table, PDO $dbh) {
        $columns = [];
        $rs = $dbh->query("SELECT * FROM $table LIMIT 0");
        for ($i = 0; $i < $rs->columnCount(); $i++) {
            $col = $rs->getColumnMeta($i);
            $columns[] = $col['name'];
        }
        return $columns;
    }

    public static function returnIngombroTecnico(PDO $dbh, $nome_prodotto, $motore_led, $sistema_accensione, $connettore, $sistema_fissaggio) {
        $stmt = $dbh->prepare(
            "SELECT ingombro_tecnico FROM prodotto_lineare_motore_led_accensione
             WHERE prodotto_lineare = :prodotto
               AND motore_led = :motore
               AND id_sistema_accensione = :accensione
               AND id_sistema_fissaggio = :fissaggio
               AND id_connettore = :connettore
             GROUP BY ingombro_tecnico"
        );
        $stmt->execute([
            ':prodotto'   => $nome_prodotto,
            ':motore'     => $motore_led,
            ':accensione' => $sistema_accensione,
            ':fissaggio'  => $sistema_fissaggio,
            ':connettore' => $connettore
        ]);
        $ingombro = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if (count($ingombro) === 1) {
            return $ingombro[0]['ingombro_tecnico'];
        }
        return 0;
    }

    public static function returnLunghezzaReel($LU, $motore_led) {
        switch ($motore_led) {
            case 'G':
                return floor($LU / 41.7) * 41.7;
            case 'N':
                return floor($LU / 83.3) * 83.3;
            case 'C':
                return floor($LU / 27.8) * 27.8;
            case 'M':
                return floor($LU / 55.6) * 55.6;
            case 'E':
                return floor($LU / 19.2) * 19.2;
            case 'I':
                return floor($LU / 38.5) * 38.5;
            case 'D':
                return floor($LU / 50) * 50;
            case 'F':
                return floor($LU / 25) * 25;
        }
        return 0;
    }

    public static function returnPotenzaReel($LU_reel, $motore_led) {
        switch ($motore_led) {
            case 'G':
            case 'N':
                return round($LU_reel * 0.0078, 1);
            case 'C':
            case 'M':
                return round($LU_reel * 0.0117, 1);
            case 'E':
            case 'I':
                return round($LU_reel * 0.0169, 1);
            case 'D':
                return round($LU_reel * 0.0144, 1);
            case 'F':
                return round($LU_reel * 0.0155, 1);
        }
        return 0;
    }

    public static function returnLunghezzaProfiloAlluminio($lunghezza_lampada, $nome_prodotto, $tipo_fissaggio, $tipo_connettore) {
        $app = 0;
        switch ($nome_prodotto) {
            case 'BALI':
                $app = 4;
                break;
            case 'BRASILIA':
                switch ($tipo_fissaggio) {
                    case '1':
                        $app = 24;
                        break;
                    case '2':
                        $app = 16;
                        break;
                    case '3':
                        $app = 32;
                        break;
                }
                break;
            case 'DERBY':
                $app = 8;
                break;
            case 'GENEVE':
                $app = 4;
                break;
            case 'LEDO':
                $app = 13;
                break;
            case 'LUGANO':
                $app = 4;
                break;
            case 'MALINDI':
                $app = 16;
                break;
            case 'MALINDI-in':
                $app = 4;
                break;
            case 'MANILA':
                $app = 16;
                break;
            case 'MISKA':
                $app = 0;
                break;
            case 'PERTH':
                $app = 8;
                break;
            case 'SKYLINE':
                switch (true) {
                    case ($tipo_fissaggio == '1' && $tipo_connettore != '3'):
                        $app = 22;
                        break;
                    case ($tipo_fissaggio == '2' && $tipo_connettore != '3'):
                        $app = 12;
                        break;
                    case ($tipo_fissaggio == '1' && $tipo_connettore != '3'):
                        $app = 30;
                        break;
                    case ($tipo_connettore == 3):
                        $app = 32;
                        break;
                }
                break;
            case 'TIFANY':
                $app = 16;
                break;
            case 'VENICE':
                $app = 18;
                break;
            case 'BORNEO':
                $app = 0;
                break;
        }
        return ($lunghezza_lampada - $app);
    }

    public static function returnLunghezzaProfiloPlastico($lunghezza_lampada, $nome_prodotto, $tipo_fissaggio, $tipo_sistema_accensione) {
        $app = 0;
        switch ($nome_prodotto) {
            case 'LEDO':
                $app = 13;
                break;
            case 'BORNEO':
                switch ($tipo_fissaggio) {
                    case '1':
                        $app = 0;
                        break;
                    case '3':
                        $app = 11;
                        break;
                }
                break;
            case 'BRASILIA':
                switch ($tipo_fissaggio) {
                    case '1':
                        $app = 25.5;
                        break;
                    case '2':
                        $app = 17.5;
                        break;
                    case '3':
                        $app = 33.5;
                        break;
                }
                break;
            case 'SKYLINE':
                switch ($tipo_fissaggio) {
                    case '1':
                        $app = 22;
                        break;
                    case '2':
                        $app = 12;
                        break;
                    case '3':
                        $app = 30;
                        break;
                }
                break;
            case 'DERBY':
                $app = 8;
                break;
            case 'PERTH':
                $app = 8;
                break;
            case 'LUGANO':
                $app = 4;
                break;
            case 'GENEVE':
                $app = 4;
                break;
            case 'BALI':
                $app = 49;
                break;
            case 'MANILA':
                $app = 57;
                break;
            case 'MALINDI':
                $app = 0;
                break;
            case 'MALINDI-in':
                $app = 0;
                break;
            case 'TIFANY':
                $app = 0;
                break;
            case 'MISKA':
                $app = 0;
                break;
            case 'VENICE':
                switch ($tipo_sistema_accensione) {
                    case '3':
                        $app = 42;
                        break;
                    default:
                        $app = 35;
                        break;
                }
                break;
        }
        return ($lunghezza_lampada - $app);
    }
}
?>
