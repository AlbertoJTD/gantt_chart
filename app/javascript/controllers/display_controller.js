import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display"
export default class extends Controller {
  static targets = ['element'];

  hide(e) {
    e.preventDefault();
    this.elementTarget.classList.toggle('hidden');
  }
}
