let prism = document.querySelector(".rec-prism");

function showAdmin(){
  prism.style.transform = "translateZ(-100px) rotateY( -90deg)";
}
function showTeacher(){
  prism.style.transform = "translateZ(-100px)";
}
function showStudent(){
  prism.style.transform = "translateZ(-100px) rotateY( -180deg)";
}



function showContactUs(){
  prism.style.transform = "translateZ(-100px) rotateY( 90deg)";
}

function showThankYou(){
  prism.style.transform = "translateZ(-100px) rotateX( 90deg)";
}