/**
 * Created by savannah on 8/30/14.
 */

$(document).ready(function () {

  $('.filter-search').on({
      'click': function () {
        $('#search-story-area').toggle();
        $('#search-users-area').toggle();
      },
      'mouseover': function () {
        $(this).addClass('highlight-text-hover')
      },
      'mouseleave': function () {
        $(this).removeClass('highlight-text-hover')
      }
    });
});