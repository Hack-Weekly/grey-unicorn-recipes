import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "form" ]
  static values = { currentQuery: String }

  connect() {
    this.currentQueryValue = this.inputTarget.value
  }

  prevent(event) {
    let newQuery = this.inputTarget.value.trim()
    if (newQuery === "" || newQuery === this.currentQueryValue) {
      event.preventDefault()
    } else {
      this.currentQueryValue = newQuery
    }
  }
}
