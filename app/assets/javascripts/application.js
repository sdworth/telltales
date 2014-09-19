// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// require "strftime.min.js"


$(document).ready(function () {

  $('.button').hover(function () {
    $(this).toggleClass('button-hover');
  });

  setTimeout(function() {$('.flash').fadeOut(1000)}, 3000);

  $(document).ready(function() {
    function setHeight() {
      var toHeight = $(window).height();
      $('.wrapper').css({
        'min-height': toHeight - 125 + 'px'
      });
    }

    $(window).on('resize', function() { setHeight(); });
    setHeight();
  });

});
