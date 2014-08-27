/**
 * Created by savannah on 8/18/14.
 */
$(document).ready(function () {
  $('.dropdown-button').click(function(e) {
    e.stopPropagation();
    $('.header-dropdown-menu').toggle();
    $('.header-dropdown-menu').css('right', '5%');
    $('.search').hide();
    $(this).toggleClass('header-clicked');
    $('.search-button').removeClass('header-clicked')
  });

  $('.search-button').click(function(e) {
    e.stopPropagation();
    $('.search').toggle();
    $('.search').css('right', '5%');
    $('.header-dropdown-menu').hide();
    $(this).toggleClass('header-clicked');
    $('.dropdown-button').removeClass('header-clicked')
  });

  $('.header-dropdown-menu').click(function(e) {e.stopPropagation()});
  $('.search').click(function(e) {e.stopPropagation()});

  $('body').click(function() {
    $('.header-dropdown-menu').hide();
    $('.search').hide();
    $('.header-clicked').removeClass('header-clicked')
  });
});