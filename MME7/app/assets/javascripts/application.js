//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .
//= require bootstrap-datepicker

$(function() {
  $("#project_start_date").datepicker( { format:  "dd/mm/yyyy" } );
  $("#project_end_date").datepicker( { format: "dd/mm/yyyy" } );
});


$(function(){
 $("#Budget-serach input").keyup(function (){
    $.get($("#Budget-serach").attr("action"), $("#Budget-serach").serialize(), null, "script");
    return false;
  });
});


$(function() {
  $("#project_user_tokens").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $("#project_user_tokens").data("pre"),
    theme: "facebook"
  });
});