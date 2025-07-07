import { computed } from 'https://unpkg.com/vue@3/dist/vue.esm-browser.prod.js'

export default function useDiscount() {
  const calcoloSconto = (importo, coefficienteSconto) => {
    let app = 0
    switch (coefficienteSconto) {
      case '50':
        app = 0.5
        break
      case '50+20':
        app = 0.4
        break
      case '50+15':
        app = 0.425
        break
      case '50+10':
        app = 0.45
        break
      case '50+5':
        app = 0.475
        break
      case '40+10':
        app = 0.54
        break
      case '40+20':
        app = 0.48
        break
      case '40+20+10':
        app = 0.432
        break
      default:
        app = 1
    }
    return importo * app
  }

  return { calcoloSconto }
}
