/**
 * Created by savannah on 9/5/14.
 */


$(document).ready(function () {

  $("#contribution-tab").click(function(){
    $('.profile-starts-display').slideUp(1000);
    setTimeout(function(){$('.profile-additions-display').slideDown(1000)}, 1000);
  });

  $("#create-tab").click(function(){
    setTimeout(function(){$('.profile-starts-display').slideDown(1000)}, 1000);
    $('.profile-additions-display').slideUp(1000);
  });

  $('.follow-button').click(function(){
    var url = $(this).attr('id');
    var that = this;

    $.post(url, function(){
      $(that).text('following')
      .addClass('followed-button')
    })
  });

});