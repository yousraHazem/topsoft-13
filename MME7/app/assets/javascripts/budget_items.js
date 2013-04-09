$(document).ready(function(){
$('th').css("background-color","#ff0");
 $("tr:even").css("background-color","#cef");
 $('tr:odd').css("background-color","#ffc");
});


$(document).ready(function() {
$("tr").mouseenter(function() {
$(this).css("color","red");
});
$("tr").mouseleave(function() {
$(this).css("color","blue");
});
});


