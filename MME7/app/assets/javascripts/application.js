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


$(function () {
  $('#budget_source_project_tokens').tokenInput('/projects.json', { crossDomain: false , prePopulate: $('#budget_source_project_tokens').data('pre') , theme: 'facebook'});
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
  $("#search input").keyup(function (){
     $.get($("#search").attr("action"), $("#search").serialize(), null, "script");
     });

});
$(function(){
 $("#Budget-serach input").keyup(function (){
    $.get($("#Budget-serach").attr("action"), $("#Budget-serach").serialize(), null, "script");
     return false;
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
    $("#new-item").click(function(){
        $("#item-form").toggle("slow");
    });
});



jQuery.ajaxSetup({
   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})
$(function() {
    $("#p").click(function() {
      $("#grp").slideToggle();   
    });
});

