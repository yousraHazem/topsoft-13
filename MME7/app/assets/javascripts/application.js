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
