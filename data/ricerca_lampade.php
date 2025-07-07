<?php
require_once('../Utility/calcolaPrezzo.php');

$lunghezza_lampada = $_REQUEST['lunghezza_lampada'];
$motore_led = $_REQUEST['motore_led'];
$sistema_fissaggio = $_REQUEST['sistema_fissaggio'];
$sistema_accensione = $_REQUEST['sistema_accensione'];
$connettore = $_REQUEST['connettore_alimentazione'];
$tipo_schermo = isset($_REQUEST['tipo_schermo']) ? $_REQUEST['tipo_schermo'] : '';
$lunghezza_cavo = isset($_REQUEST['lunghezza_cavo']) ? $_REQUEST['lunghezza_cavo'] : 0;
$giunzione_MF = isset($_REQUEST['giunzione_MF']) ? $_REQUEST['giunzione_MF'] : 'false';
$qta = isset($_REQUEST['qta_richiesta']) ? $_REQUEST['qta_richiesta'] : 1;

$dbh = dbConn::getConnection();

$sql = $dbh->prepare("SELECT DISTINCT pl.prodotto_lineare AS nome_prodotto
                       FROM prodotto_lineare_motore_led_accensione pl
                       JOIN prodotti_lineari p ON p.nome_prodotto = pl.prodotto_lineare
                       WHERE pl.motore_led = :motore
                         AND pl.id_sistema_accensione = :accensione
                         AND pl.id_sistema_fissaggio = :fissaggio
                         AND pl.id_connettore = :connettore
                         AND p.obsoleta = 0
                         AND p.lunghezza_minima_accettata <= :len
                         AND p.lunghezza_massima_accettata >= :len");
$sql->execute(array(
    ':motore' => $motore_led,
    ':accensione' => $sistema_accensione,
    ':fissaggio' => $sistema_fissaggio,
    ':connettore' => $connettore,
    ':len' => $lunghezza_lampada
));
$prodotti = $sql->fetchAll(PDO::FETCH_ASSOC);

$rows = array();
foreach ($prodotti as $row) {
    $params = array(
        'prodotto' => $row['nome_prodotto'],
        'lunghezza_lampada' => $lunghezza_lampada,
        'motore_led' => $motore_led,
        'tipo_schermo' => $tipo_schermo,
        'sistema_fissaggio' => $sistema_fissaggio,
        'sistema_accensione' => $sistema_accensione,
        'connettore_alimentazione' => $connettore,
        'lunghezza_cavo' => $lunghezza_cavo,
        'giunzione_MF' => $giunzione_MF,
        'qta_richiesta' => $qta
    );
    $res = calcolaPrezzo($params);
    $rows[] = array(
        'nome_prodotto' => $res['nome_prodotto'],
        'prezzo_listino' => $res['prezzo_listino']
    );
}

echo json_encode(array('rows' => $rows));
?>
