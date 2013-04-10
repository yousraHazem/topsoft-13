//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .


jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

$(document).ready(function (){
     $('#post-form').submit(function (){
       $.post($(this).attr('action'), $(this).serialize(), null, "script");
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