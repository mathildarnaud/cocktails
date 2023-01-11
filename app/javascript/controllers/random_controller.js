import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random"
export default class extends Controller {

  connect() {
    console.log('connected')
}

// document.addEventListener("prechange"), function(event) {
//   document.querySelector('ons-toolbar .center')
//   .innerHTML = event.tabItem.getAttribute('label');
// });


}
