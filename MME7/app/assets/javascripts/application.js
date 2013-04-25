//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require_tree .
//= require bootstrap-datepicker


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


$(document).ready(function(){
$("#comment-form").submit(function(){
$.comment($(this).attr("action"),$(this).serialize(),null, "script");
return false;
});
});

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
    $("#price, #total").keyup(function() {
        var p = $("#price").val();
        var q = $("#total").val();
        $("#amount").val(q * p);
    });
});

 $(function() {
    $("#total, #qty").keyup(function() {
        var p = $("#total").val();
        var q = $("#qty").val();
        if (p == q)
        $("#status").val("اكتمل");
        else
        $("#status").val("معلق");
    });
});


 $(function() {
    $("#price, #qty").keyup(function() {
        var p = $("#price").val();
        var q = $("#qty").val();
        $("#spent").val(q * p);
    });
});

 $(function(){
    var p = $("#data").val();
$("#progress").css('width',p+'%');
$("#progress").html(p+'%');
});

 $(function() {
    $("#create").click(function(){
        $("#comp").toggle("slow");
    });
});




$(function() {
    $("#p").click(function() {
      $("#grp").slideToggle();   
    });
});

$(document).ready(function(){
    $('#check').change(function(){
        if(this.checked)
            $('#connect').show("slow");
        else
            $('#connect').hide();

    });
});


$(function() {
    $("#new-item").click(function(){
        $("#item-form").toggle("slow");
    });
});


$(function () {
  $('#budget_source_project_tokens').tokenInput('/projects.json', { 
    preventDuplicates: true,
    crossDomain: false , 
    prePopulate: $('#budget_source_project_tokens').data('pre') , 
    theme: 'facebook' , 
    });
});
