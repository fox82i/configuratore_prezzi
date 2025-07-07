# Configuratore Prezzi

This project exposes a small PHP API to calculate the price of a lamp based on a set of parameters.

## Usage

Include the `PriceCalculator` class and provide it with a `PDO` instance. Pass an associative array of parameters to `calculate()` and you will receive the same structure previously returned by `calcolaPrezzo`.

```php
require_once 'config/dbconfig.inc.php';
require_once 'Utility/PriceCalculator.php';

$pdo = dbConn::getConnection();
$calculator = new PriceCalculator($pdo);

$result = $calculator->calculate([
    'prodotto' => 'BALI',
    'lunghezza_lampada' => 500,
    // ... altri parametri ...
]);
```

The method returns an array ready to be encoded as JSON:

```php
echo json_encode($result);
```

Endpoints such as `data/determina_prezzo.php` and `data/ricerca_lampade.php` already instantiate this class and output its result.
