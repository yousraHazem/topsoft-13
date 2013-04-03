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
//= require_tree .

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
        $("#status").val("Approved");
        else
        $("#status").val("Pending");
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
  $("#search input").live('keyup', function (){
    $.get($("#search").attr("action"), $("#search").serialize(), null, "script");
    return false;
  });
});


// $(function() {
//     var name = $( "#name" ),
//       price = $( "#price" ),
//       qty = $( "#passwordqty" ),
//       allFields = $( [] ).add( name ).add( price ).add( qty ),
 
//     $( "#dialog-form" ).dialog({
//       autoOpen: false,
//       height: 300,
//       width: 350,
//       modal: true,
//       buttons: {
//         Cancel: function() {
//           $( this ).dialog( "close" );
//         }
//       },
//       close: function() {
//         allFields.val( "" ).removeClass( "ui-state-error" );
//       }
//     });
 
//     $( "#create" )
//       .button()
//       .click(function() {
//         $( "#dialog-form" ).window( "open" );
//       });
//   });















