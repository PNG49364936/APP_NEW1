import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "screen" ]

  clickScreen() {
    console.log('test')
    this.screenTarget.style.backgroundColor = "#F5CC41";

    setTimeout(() => {
      alert("Pour modifier votre demande, clicker sur 'mise à jour'");
    }, 30);
  
  }
}