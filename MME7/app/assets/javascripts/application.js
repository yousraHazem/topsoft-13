//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .

$(document).ready(function(){
    $('#check').change(function(){
        if(this.checked)
            $('#connect').show("slow");
        else
            $('#connect').hide();
  });
});


$(function(){
 $("#Budget-serach input").keyup(function (){
    $.get($("#Budget-serach").attr("action"), $("#Budget-serach").serialize(), null, "script");
    return false;
  });
});

$(function() {
    $("#p").click(function() {
      $("#grp").slideToggle();   
    });
});



$(function() {
    $("#new-item").click(function(){
        $("#item-form").toggle("slow");
    });
});


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






$(document).ready(function(){
$("#comment-form").submit(function(){
$.comment($(this).attr("action"),$(this).serialize(),null, "script");
return false;
});
});