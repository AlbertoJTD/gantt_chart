import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart--gantt"
export default class extends Controller {
  static values = {
    project: Number
  }

  connect() {
    const ganttContainer = this.element;
    gantt.init(ganttContainer);
  }
}
