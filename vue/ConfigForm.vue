<template>
  <v-container>
    <v-form>
      <v-row>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.prodotto"
            :items="prodotti"
            label="Prodotto"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="form.lunghezza"
            label="Lunghezza (mm)"
            maxlength="4"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.motore_led"
            :items="motoriLed"
            label="Motore Led"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.colore_luce"
            :items="coloriLuce"
            label="Colore luce"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.tipo_schermo"
            :items="tipiSchermo"
            label="Schermo"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.sistema_fissaggio"
            :items="sistemiFissaggio"
            label="Sistema fissaggio"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.sistema_accensione"
            :items="sistemiAccensione"
            label="Sistema accensione"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.connettore_alimentazione"
            :items="connettori"
            label="Connettore alimentazione"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="form.lunghezza_cavo_alim"
            label="Lunghezza cavo alimentazione"
            maxlength="4"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-checkbox
            v-model="form.giunzione_MF"
            label="Giunzione M/F"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-select
            v-model="form.uscita_cavo"
            :items="usciteCavo"
            label="Uscita Cavo"
          />
        </v-col>
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="form.qta"
            label="Quantità richiesta"
            maxlength="3"
          />
        </v-col>
        <v-col cols="12">
          <v-btn color="primary" @click="submit">Determina prezzo</v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-container>
</template>

<script>
export default {
  name: 'ConfigForm',
  data() {
    return {
      form: {
        prodotto: '',
        lunghezza: '',
        motore_led: '',
        colore_luce: '',
        tipo_schermo: '',
        sistema_fissaggio: '',
        sistema_accensione: '',
        connettore_alimentazione: '',
        lunghezza_cavo_alim: '',
        giunzione_MF: false,
        uscita_cavo: '',
        qta: ''
      },
      prodotti: [],
      motoriLed: [],
      coloriLuce: [],
      tipiSchermo: [],
      sistemiFissaggio: [],
      sistemiAccensione: [],
      connettori: [],
      usciteCavo: []
    }
  },
  methods: {
    submit() {
      // invio dati
    }
  }
}
</script>
