<?php
require_once('../config/dbconfig.inc.php');
require_once('../Utility/PriceCalculator.php');

$dbh = dbConn::getConnection();
$calculator = new PriceCalculator($dbh);

echo json_encode($calculator->calculate($_REQUEST));
?>
