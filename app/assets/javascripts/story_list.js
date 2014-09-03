/**
 * Created by savannah on 8/27/14.
 */

$(document).ready(function () {
  var closeBlurb = function () {
    var toBeClosed = $('.open-blurb').find('.closed-story-blurb');
    setTimeout(function() {$(toBeClosed).fadeIn(500)}, 500);


    $('.open-blurb').find('.open-blurb-story').fadeOut(500)
      .end().find('.addition-form').fadeOut(500)
      .end().one('click', function () {
        closeBlurb();
        var that = this;

        $(this).find('.closed-story-blurb').fadeOut(500);
        setTimeout(function() {
          $(that).find('.open-blurb-story').fadeIn(500)
          .end().find('.addition-form').fadeIn(500)
          .end().addClass('open-blurb')
          .one('click', function () {
            closeBlurb()})
          }, 500)
      })
      //.find('closed-story-blurb') //.setTimeout(function(){ $(this).fadeIn(500)}, 500)
      .removeClass('open-blurb')
  };


  $('.blurb-story').one('click', function () {
    var blurb = this;

    $(this).one('click', function (e) {
      e.stopImmediatePropagation();
      closeBlurb()
    });

    var url = $(this).attr('id');
    $.getJSON(url, function (story_array) {

      closeBlurb();


      $(blurb).find('.closed-story-blurb').fadeOut(500);

      $(blurb).parent('.story-blurb').addClass('open-blurb');

      setTimeout(function () {
        $(blurb).find('.addition-form')
          .click(function (e) {
            e.stopPropagation();
          })
          .before(
          '<div class="open-blurb-story"></div>');


        var addition_target = $(blurb).find(".open-blurb-story");

        $.each(story_array[0], function (index, addition) {

          var username;

          $.each(story_array[1], function (index, username_array) {
            if (username_array[0] == addition.id) {
              username = username_array[1]
            }
          });

          $(addition_target).append("<p class='addition-header'>Addition #" + addition.addition_number + " by <span class='highlight-text'>" + username + '</span>, Created on: ' + addition.created_at + '</p><p class="addition-text">' + addition.addition_text + '</p>')

        });

        $(blurb).find('.addition-form').fadeIn(500)
      }, 500);

    }).success();

  });


//deals with changing the addition form remaining characters
  $('.addition-text').on('input', function () {
    var charaPara = $(this).parents('.addition-form').find('#remaining-characters');

    $(charaPara).empty();

    var chars = 140 - $(this).val().length;
    if (chars < 0) {
      $(charaPara).append(0);
    }
    else {
      $(charaPara).append(chars)
    }

    if ($(this).val().length > 140) {
      this.value = this.value.substring(0, 140)
    }
  });
});