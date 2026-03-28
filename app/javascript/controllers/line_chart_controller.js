import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js"

export default class extends Controller {
  static values = { days: Array, labels: Array }

  connect() {
    new Chart(this.element, {
      type: "line",
      data: {
        labels: this.labelsValue,
        datasets: [{
          data: this.daysValue,
          borderColor: "#111827",
          backgroundColor: "rgba(17, 24, 39, 0.08)",
          pointBackgroundColor: "#111827",
          pointRadius: 4,
          tension: 0.3,
          fill: true
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { beginAtZero: true, ticks: { precision: 0 } },
          x: { grid: { display: false } }
        }
      }
    })
  }
}
