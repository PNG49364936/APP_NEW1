import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "screen" ]

  clickScreen() {
    console.log('test')
    this.screenTarget.style.backgroundColor = "#FFFF00";

    setTimeout(() => {
      console("Pour xxxx votre demande, clicker sur 'mise à jour'");
    }, 30);
   disconnect;
  }
}