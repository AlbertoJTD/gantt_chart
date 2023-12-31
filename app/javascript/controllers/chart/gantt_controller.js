import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart--gantt"
export default class extends Controller {
  static values = {
    project: Number
  }

  connect() {
    const ganttContainer = this.element;

    gantt.config.date_format = "%Y-%m-%d %H:%i:%s"; 
    gantt.init(ganttContainer);
    gantt.load(`/api/${this.projectValue}/data`);

    var dp = new gantt.dataProcessor(`/api/${this.projectValue}`);
    dp.init(gantt);
    dp.setTransactionMode("REST");
  }
}
