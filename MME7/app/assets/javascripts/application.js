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

