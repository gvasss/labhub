import { Controller } from "@hotwired/stimulus";
import "bootstrap";

export default class extends Controller {
  connect() {
    document.body.addEventListener("click", (event) => {
      if (event.target.closest(".single-post-card, .single-post-list")) {
        this.showModal(event);
      }
    });
  }

  showModal(event) {
    const post = event.target.closest(".single-post-card, .single-post-list");
    if (!post) return;

    const postedBy = post.querySelector(".post-content .posted-by")?.innerHTML;
    const postHeading = post.querySelector(".post-content h3")?.innerHTML;
    const postContent = post.querySelector(".post-content p")?.innerHTML;
    const interestedLink = post.querySelector(".post-content .interested a")?.getAttribute("href");

    document.querySelector("#postModal .posted-by").textContent = postedBy;
    document.querySelector("#postModal .loaded-data h3").textContent = postHeading;
    document.querySelector("#postModal .loaded-data p").textContent = postContent;
    document.querySelector("#postModal .loaded-data .interested a").setAttribute("href", interestedLink);

    const modal = new bootstrap.Modal(document.getElementById("postModal"));
    modal.show();
  }
}