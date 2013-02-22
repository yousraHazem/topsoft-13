 /**$(document).ready(function(){
		$("#b1").click(function(){
                $("#b1off").toggle();
		});
		});
 $(document).ready(function(){
		$("#b2").click(function(){
                $("#b2off").slidetoggle("slow");
		});
		
$(document).ready(function(){ 
						   
	$("div").css("border", "3px solid red");
	
});
$(document).ready(function(){
  $("b1").click(function(){
    $("#b1off").show();
  });
});**/


function showb1() {
    dd = document.getElementById('b1off');
    dd.style.display = "block";
}

function showb2() {
    dd = document.getElementById('b2off');
    dd.style.display = "block";
}
