// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require chosen-jquery
//= require cocoon
//= require bootstrap
//= require js-routes
//= require bootstrap-switch/dist/js/bootstrap-switch
//= require redactor-rails
//= require_self

$(document).ready(function() {
  $('input:checkbox').bootstrapSwitch();
 });

$(function(){
  $('.chosen-select').chosen({disable_search_threshold: 10});

  //FIXME to reactjs
  var switcher = $('.make-switch');
  switcher.on('switchChange.bootstrapSwitch', function(e, state) {
    var $el = $(this);
    if (state)
      $el.find("a.on").click();
    else
      $el.find("a.off").click();
  });

  $("#teacher_suggestion").on("ajax:success", function(e, data, status, xhr) {
    window.location.reload();
  });

  $(".switch-state, .switch-course-state").on("ajax:success", function(e, data, status, xhr) {
    window.location.reload();
  });
});
