import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart--gantt"
export default class extends Controller {
  connect() {
    console.log('Hello from chart--gantt');

    const ganttContainer = this.element;
    gantt.init(ganttContainer);
  }
}
