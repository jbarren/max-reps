import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count", "input"]

  connect() {
    this.count = parseInt(this.inputTarget.value) || 0
    this.render()
  }

  increment(event) {
    this.count = Math.max(0, this.count + parseInt(event.params.amount))
    this.render()
  }

  decrement(event) {
    this.count = Math.max(0, this.count - parseInt(event.params.amount))
    this.render()
  }

  render() {
    this.countTarget.textContent = this.count
    this.inputTarget.value = this.count
  }
}
