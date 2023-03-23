import { Controller } from "stimulus"

export default class extends Controller {
  

connect() {
    console.log("test22")
    const saveButton = document.getElementById('progress');
    console.log(saveButton)
    const progressBar = document.querySelector('#progressbar');
    console.log(progressBar)
    saveButton.addEventListener('click', () => {
      // Affichez la barre de progression en modifiant la valeur de la propriété "display" de "none" à "block"
      progressBar.style.display = 'block';
    });
  }
}



  
  
  
  
  
  
  
  