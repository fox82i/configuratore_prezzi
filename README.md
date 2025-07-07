# Ricerca lampade

Il file `Utility/calcolaPrezzo.php` espone la funzione `calcolaPrezzo()` che incapsula tutta la logica di calcolo del prezzo precedentemente presente in `data/determina_prezzo.php`.

## Endpoint `data/ricerca_lampade.php`

Permette di ricercare i prodotti compatibili con i parametri inseriti e restituisce il prezzo di listino calcolato per ciascuna lampada.

### Parametri
- `lunghezza_lampada`
- `motore_led`
- `sistema_fissaggio`
- `sistema_accensione`
- `connettore_alimentazione`
- `tipo_schermo` (opzionale)
- `lunghezza_cavo` (opzionale, default 0)
- `giunzione_MF` (opzionale, default "false")
- `qta_richiesta` (opzionale, default 1)

### Output
Restituisce un JSON nel formato:
```json
{
  "rows": [
    {"nome_prodotto": "PRODOTTO", "prezzo_listino": 100.00},
    ...
  ]
}
```

## Frontend
È stata aggiunta la pagina `ricerca_lampade.html` che invia i parametri all'endpoint e visualizza l'elenco delle lampade tramite `jqxGrid`.
