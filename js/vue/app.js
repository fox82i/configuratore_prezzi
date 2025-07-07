import { createApp } from 'https://unpkg.com/vue@3/dist/vue.esm-browser.prod.js'
import useDataSources from './composables/useDataSources.js'
import useDiscount from './composables/useDiscount.js'

const App = {
  setup() {
    const dataSources = useDataSources()
    const discount = useDiscount()

    // load initial data
    dataSources.loadProducts()
    dataSources.loadMotoriLed()
    dataSources.loadColoriLuce()
    dataSources.loadSchermi()
    dataSources.loadSistemiFissaggio()
    dataSources.loadSistemiAccensione()
    dataSources.loadConnettori()

    return {
      ...dataSources,
      ...discount
    }
  }
}

createApp(App).mount('#app')
