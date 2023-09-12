import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart--gantt"
export default class extends Controller {
  connect() {
    const ganttContainer = this.element;
    gantt.init(ganttContainer);
  }
}
