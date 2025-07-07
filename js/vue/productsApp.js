import { createApp, ref, onMounted } from 'https://unpkg.com/vue@3/dist/vue.esm-browser.prod.js'
import { createVuetify } from 'https://cdn.jsdelivr.net/npm/vuetify@3/dist/vuetify.esm.js'
import * as components from 'https://cdn.jsdelivr.net/npm/vuetify@3/dist/vuetify.esm.js'
import * as directives from 'https://cdn.jsdelivr.net/npm/vuetify@3/dist/vuetify.esm.js'

const vuetify = createVuetify({ components, directives })

const App = {
  setup() {
    const products = ref([])
    const loading = ref(false)
    const error = ref(null)

    const headers = [
      { title: 'Prodotto', value: 'prodotto' },
      { title: 'Lunghezza minima', value: 'lunghezza_minima_accettata' },
      { title: 'Lunghezza massima', value: 'lunghezza_massima_accettata' }
    ]

    const load = async () => {
      loading.value = true
      error.value = null
      try {
        const res = await fetch('data/enumerate_products.php')
        if (!res.ok) throw new Error('Network error')
        const json = await res.json()
        products.value = json.rows || json
      } catch (err) {
        error.value = err.message
      } finally {
        loading.value = false
      }
    }

    onMounted(load)

    return { products, headers, loading, error, load }
  },
  template: `
    <v-app>
      <v-main>
        <v-container>
          <v-alert type="error" v-if="error" class="mb-4">{{ error }}</v-alert>
          <v-progress-linear indeterminate v-if="loading"></v-progress-linear>
          <v-data-table
            :headers="headers"
            :items="products"
            v-if="!loading && !error"
            class="mt-4"
          ></v-data-table>
        </v-container>
      </v-main>
    </v-app>
  `
}

createApp(App).use(vuetify).mount('#products-app')

