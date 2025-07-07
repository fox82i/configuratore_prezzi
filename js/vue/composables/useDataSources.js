import { reactive } from 'https://unpkg.com/vue@3/dist/vue.esm-browser.prod.js'

export default function useDataSources() {
  const state = reactive({
    products: [],
    motoriLed: [],
    coloriLuce: [],
    schermi: [],
    sistemiFissaggio: [],
    sistemiAccensione: [],
    connettori: []
  })

  const fetchJson = async (url) => {
    const res = await fetch(url)
    if (!res.ok) throw new Error('Network error')
    const data = await res.json()
    return data.rows || data
  }

  const loadProducts = () => fetchJson('data/enumerate_products.php').then(r => { state.products = r })
  const loadMotoriLed = () => fetchJson('data/enumerate_motore_led.php').then(r => { state.motoriLed = r })
  const loadColoriLuce = () => fetchJson('data/enumerate_temperatura_luce.php').then(r => { state.coloriLuce = r })
  const loadSchermi = () => fetchJson('data/enumerate_schermo.php').then(r => { state.schermi = r })
  const loadSistemiFissaggio = () => fetchJson('data/enumerate_sistema_fissaggio.php').then(r => { state.sistemiFissaggio = r })
  const loadSistemiAccensione = () => fetchJson('data/enumerate_sistema_accensione.php').then(r => { state.sistemiAccensione = r })
  const loadConnettori = () => fetchJson('data/enumerate_connettore_alimentazione.php').then(r => { state.connettori = r })

  return {
    state,
    loadProducts,
    loadMotoriLed,
    loadColoriLuce,
    loadSchermi,
    loadSistemiFissaggio,
    loadSistemiAccensione,
    loadConnettori
  }
}
