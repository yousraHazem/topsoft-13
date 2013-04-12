# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
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
