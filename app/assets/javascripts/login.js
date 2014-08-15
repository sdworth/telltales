/**
 * Created by savannah on 8/15/14.
 */
$(document).ready(function () {
  $('.register').on(
    {
      mouseenter: function () {
        $(this).toggleClass('highlight-text-hover');
      },
      mouseleave: function () {
        $(this).toggleClass('highlight-text-hover');
      },
      click: function () {
        $('.login-block').toggle();
        $('.register-block').css('display', 'inline-block')
      }}
  );

  $('#register-form').find('input').on(blur, function() {

  });


  $('.login').on(
    {mouseover: function () {
      $(this).toggleClass('highlight-text-hover');
    },
      click: function () {
        $('.login-block').toggle();
        $('.register-block').css('display', 'none')
      }});
});