import { Controller } from "stimulus"

export default class extends Controller {
  static targets =["recipe1"]

  toggleRecipe() {
   console.log("test")
 
    if (this.recipe1Target.classList.contains("d-none")) {

      this.recipe1Target.classList.remove("d-none");

    } else {
      this.recipe1Target.classList.add("d-none");
    }
  }
}