$(document).ready(function(){
  $("button").click(function(){
    $("#test").hide();
  });
});

function alert(obj){
	obj.innerHTML = "bla bla" ;
}

function displayDate()
{
document.getElementById("demo").innerHTML=Date();
}

