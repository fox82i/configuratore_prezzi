<?php
require_once('../Utility/calcolaPrezzo.php');

$params = array(
    'prodotto' => $_REQUEST['prodotto'],
    'lunghezza_lampada' => $_REQUEST['lunghezza_lampada'],
    'motore_led' => $_REQUEST['motore_led'],
    'tipo_schermo' => $_REQUEST['tipo_schermo'],
    'sistema_fissaggio' => $_REQUEST['sistema_fissaggio'],
    'sistema_accensione' => $_REQUEST['sistema_accensione'],
    'connettore_alimentazione' => $_REQUEST['connettore_alimentazione'],
    'lunghezza_cavo' => $_REQUEST['lunghezza_cavo'],
    'giunzione_MF' => $_REQUEST['giunzione_MF'],
    'qta_richiesta' => $_REQUEST['qta_richiesta']
);

$crud = calcolaPrezzo($params);
$results['rows'] = $crud;

echo json_encode($results);
?>
