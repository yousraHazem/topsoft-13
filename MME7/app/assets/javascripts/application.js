// //= require jquery
// //= require jquery_ujs
// //= require jquery.purr
// //= require best_in_place
// //= require_tree .
// //= require bootstrap-datepicker

$(function() {
$('#ca-container').contentcarousel({
    sliderSpeed     : 500,
    sliderEasing    : 'easeOutExpo',
    itemSpeed       : 500,
    itemEasing      : 'easeOutExpo',
    scroll          : 1 
});  
});

$(function(){
    $(".notification-bubble").click(function(){
        $("#notify").toggle();

        $(".pic").toggle();
        // $(".notification-bubble").hide();

        $.ajax({
            url: "/notifications/read",
            type: "GET",
            dataType: "script"
        });
    });
});

$(function() {
    $("#new-item").click(function(){
        $("#item-form").toggle("slow");
    });
}); 

// // $(function(){
// //    $("#projects").click(function(){
// //         $("#notify").toggle();
// //   }); 
// // });

$(function(){
  if ($("#notification-list").length > 0 ) {
    $(".notification-bubble").hide();
    $("#notify").hide();
    setTimeout(updateList, 5000);
  }
});

function updateList() {
    var userid = $("#current-user").attr("data-id");  
   if ($(".notification-list").length > 0) {
    var after2 = $(".notification-list:first").attr("data-time");
   } else {
     var after2 = "0";
   }
    $.getScript("/notifications/list.js?userid=" + userid + "&after2=" + after2 )
    setTimeout(updateList, 5000); 
}


$(function(){
    setTimeout(updateNot, 5000);
}); 

function updateNot() {
  var user_id = $("#current-user").attr("data-id");  
   if ($(".notify").length > 0) {
  var after = $(".notify:first").attr("data-time");
   } else {
  var after = "0";
   }
    $.getScript("/notifications.js?user_id=" + user_id + "&after=" + after)
    setTimeout(updateNot, 5000); 
}
 


$(function () {
  $('#budget_source_project_tokens').tokenInput('/projects.json', { 
    preventDuplicates: true,
    crossDomain: false , 
    prePopulate: $('#budget_source_project_tokens').data('pre') , 
    theme: 'facebook' , 
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

// $(function() {
//     $("#create").click(function(){
//         $("#comp").toggle("slow");
//     });
// });



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



$(function () {  
  $('#budget_item_user_tokens').tokenInput('/users.json', { crossDomain: false,prePopulate: $('#budget_item_user_tokens').data('pre'),  
    theme: 'facebook'  
  });  
});  


$(function(){
    $("#search input").keyup(function(){
        $.get($("#search").attr("action"),$("#search").serialize(), null, "script");
        return false;
    });
});

$(function() {
  $("#group_user_tokens").tokenInput("/users.json", {
    crossDomain: false,
    theme: 'facebook' ,
    preventDuplicates: true,
    prePopulate: $('#group_user_tokens').data('pre')
  });
});



