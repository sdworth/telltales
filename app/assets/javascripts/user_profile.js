/**
 * Created by savannah on 9/5/14.
 */
var followUser = function () {
  $('.follow-button').one('click', function (e) {
    var url = $(this).attr('id');
    var that = this;

    e.preventDefault();

    $.post(url, function () {
      $(that).val('following')
        .addClass('followed-button')
        .removeClass('follow-button');
      unfollowUser();
    })
  });
};

var unfollowUser = function () {
  $('.followed-button').one('click', function (e) {
    var url = $(this).attr('id');
    var that = this;

    e.preventDefault();

    $.ajax({
      url: url,
      type: 'DELETE',
      success: function () {
        $(that).val('follow')
          .removeClass('followed-button')
          .addClass('follow-button');
        followUser();
      }
    })
  })
};

$(document).ready(function () {

  $("#contribution-tab").click(function () {
    $('.profile-starts-display').slideUp(1000);
    setTimeout(function () {
      $('.profile-additions-display').slideDown(1000)
    }, 1000);
  });

  $("#create-tab").click(function () {
    setTimeout(function () {
      $('.profile-starts-display').slideDown(1000)
    }, 1000);
    $('.profile-additions-display').slideUp(1000);
  });

  followUser();
  unfollowUser();
});