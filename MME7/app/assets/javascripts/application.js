jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};


$(document).ready(function (){
     $('#new_review').submit(function (){
       $.post($(this).attr('action'), $(this).serialize(), null, "script");
       return false;
     });
   });

$('#user').hover(function() {
    $('#popup').show();
}, function() {
    $('#popup').hide();
});