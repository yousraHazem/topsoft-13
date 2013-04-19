// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
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

// $(function(){
//   $("#search input").keyup(function (){
//     $.get($("#search").attr("action"), $("#search").serialize(), null, "script");
//     return false;
//   });
// });

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

// jQuery.ajaxSetup({
//    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
// })

// $(function(){
//     $('#budget-component-dialog').dialog({
//         autoOpen: false,
//         height: 500,
//         width: 500,
//         modal:true,
//         buttons: {
//            "Create" : function() {
//             $("#component-form").submit();
//             $(this).dialog('close')
//            }
//         }
//     })

//     $('#create').button().click(function(){
//         $('#budget-component-dialog').dialog('open')
//     })
// });
