function examAnswer() {
  const answers = document.querySelectorAll(".exam-btn");
  const newElement = document.createElement("span");
  const trueContent = document.createTextNode("◯ 正解");
  const falseContent = document.createTextNode("× 不正解");
  answers.forEach(function (answer){
    answer.addEventListener("click", () => {
      const answerId = answer.getAttribute("id");
      const searchAnswer = `${answerId.slice(0,answerId.length-1)}ans`;
      for (let i=1; i <= 9; i++){
        if (document.getElementById(searchAnswer + String(i))){
          var trueAnswer = document.getElementById(searchAnswer + String(i));
          var trueNumber = i
          break;
        }
      }
      const ansStr = (searchAnswer.slice(0,searchAnswer.length-3))
      const ansVisible = document.getElementById(ansStr)
      const cssStyleDeclaration = getComputedStyle( ansVisible, null )
      const visibleValue = cssStyleDeclaration.getPropertyValue( "display" ) ;
      
      if (visibleValue === "none"){
        ansVisible.style.display = "block";
      
        if (newElement.hasChildNodes()){
          newElement.removeChild(newElement.firstChild);
        }
        if (answerId.slice(-1) === String(trueNumber)){
          newElement.appendChild(trueContent);
          newElement.setAttribute("class", "true-ans");
          trueAnswer.appendChild(newElement);
        } else {
          newElement.appendChild(falseContent);
          newElement.setAttribute("class", "false-ans");
          trueAnswer.appendChild(newElement);
        }
      }
    })
  })
}
window.addEventListener("load",(examAnswer));