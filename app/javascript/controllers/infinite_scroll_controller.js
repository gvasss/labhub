import { Controller } from "@hotwired/stimulus";
 
// Connects to data-controller="infinite-scroll"

export default class extends Controller {

  initialize() {
    this.isLoading = false;
    //this.threshold = 60; // Trigger when 60px from the bottom
  }
 
  connect() {
    window.addEventListener("scroll", this.loadMore.bind(this));
  }
 
  disconnect() {
    window.removeEventListener("scroll", this.loadMore.bind(this));
  }
 
  loadMore() {
    if (this.isLoading) return;
    
    let morePostsUrl = document.querySelector(".pagination a.next_page")?.getAttribute("href");
    let thresholdPassed = window.scrollY > document.body.scrollHeight - window.innerHeight - this.threshold;
    
    if (morePostsUrl && thresholdPassed) {
      this.isLoading = true;
      fetch(morePostsUrl, {
        headers: { "Accept": "text/javascript" },
      })
        .then((response) => response.text())
        .then((script) => {
          Turbo.renderStreamMessage(script);
          this.isLoading = false;
        })

        .catch(() => {
          this.isLoading = false;
        });
    }
  }
}