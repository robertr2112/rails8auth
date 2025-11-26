import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap" // Import Bootstrap's Modal JavaScript

export default class extends Controller {
  static targets = ["modalContent"] // Optional: for dynamic content loading

  connect() {
    this.modal = new Modal(this.element, {
      keyboard: false // Prevent closing with Escape key
    })
  }

  disconnect() {
    this.modal.dispose() // Clean up Bootstrap modal instance
  }

  // Action to show the modal
  show() {
    this.modal.show()
  }

  // Action to hide the modal
  hide() {
    this.modal.hide()
  }

  // Optional: For handling Turbo Frame events, e.g., after form submission
  submitEnd(event) {
    if (event.detail.success) {
      this.hide() // Hide modal on successful form submission
    }
  }
}