$(document).ready(function() {
$("tr").mouseenter(function() {
$(this).css("color","red");
});
$("tr").mouseleave(function() {
$(this).css("color","blue");
});
});