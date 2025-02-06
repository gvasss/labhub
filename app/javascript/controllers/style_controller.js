import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["post"];

  connect() {
    this.colorSet = this.randomColorSet();
    this.mode = Math.floor(Math.random() * 2);
    this.applyStyles();

    document.querySelector("#feed")?.addEventListener("mouseenter", (event) => {
      if (event.target.classList.contains("single-post-list")) {
        event.target.style.borderColor = this.randomColor();
      }
    });

    document.querySelector("#feed")?.addEventListener("mouseleave", (event) => {
      if (event.target.classList.contains("single-post-list")) {
        event.target.style.borderColor = "rgba(0, 0 , 0, 0.05)";
      }
    });
  }

  applyStyles() {
    document.querySelectorAll(".single-post-card").forEach((card) => {
      if (this.mode === 1) {
        card.classList.add("solid-color-mode");
        card.style.backgroundColor = this.randomColor();
      } else {
        card.classList.add("border-color-mode");
        card.style.border = `5px solid ${this.randomColor()}`;
      }
    });
  }

  randomColorSet() {
    const colorSets = [
      ["#45CCFF", "#49E83E", "#FFD432", "#E84B30", "#B243FF"],
      ["#FF6138", "#FFFF9D", "#BEEB9F", "#79BD8F", "#79BD8F"],
      ["#FCFFF5", "#D1DBBD", "#91AA9D", "#3E606F", "#193441"],
      ["#004358", "#1F8A70", "#BEDB39", "#FFE11A", "#FD7400"],
      ["#105B63", "#FFFAD5", "#FFD34E", "#DB9E36", "#BD4932"],
      ["#04BFBF", "#CAFCD8", "#F7E967", "#A9CF54", "#588F27"],
      ["#405952", "#9C9B7A", "#FFD393", "#FF974F", "#F54F29"],
    ];
    return colorSets[Math.floor(Math.random() * colorSets.length)];
  }

  randomColor() {
    return this.colorSet[Math.floor(Math.random() * this.colorSet.length)];
  }
}