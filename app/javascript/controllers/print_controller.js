import { Controller } from "stimulus";

export default class extends Controller {


  print() {
    {
        console.log("toto")
        var content = document.getElementById("printContent").innerHTML;
        var popup = window.open("", "_blank");
        popup.document.write(content);
        popup.document.close();
        popup.focus();
        popup.print();
        popup.close();
      }
  }
}