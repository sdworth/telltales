/**
 * Created by savannah on 8/27/14.
 */

var delete_addition = function (section) {
    $(section).find('.button').click(function (e) {
      var that = this;
      e.stopPropagation();
      $.ajax({
        url: $(this).attr('href'),
        type: 'DELETE',
        success: function () {
          $(that).parent('.addition-header').next('.addition-text').fadeOut(500)
            .end().fadeOut(500)
        }
      })
    })
  };

$(document).ready(function () {
  $('.addition-button').click(function (e) {
    e.preventDefault();
    var that = this;

    var url = $(this).parent('form').attr('action');
    var flash = $('.open-blurb').find('.flash').last();
    var data = {addition: {addition_text: $(this).siblings('.addition-text').val()}};
    var addition_target = $(this).parents('.open-blurb').find('.open-blurb-story');


    //allows the posting of a new story addition
    $.post(url, data, function (newData) {
      var addition = newData[0];
      var username = newData[1];

      flash.empty().show();
      flash.append('Addition has been added!');
      flash.fadeOut(5000);

      $(addition_target).append(
          "<p class='addition-header' style='display: none'>Addition #" +
          addition.addition_number +
          " by <span class='highlight-text'>" +
          username +
          '</span>, Created on: ' +
          addition.created_at +
          '</p><p class="addition-text" style="display: none">' +
          addition.addition_text +
          '</p>')
        .find('.addition-header:nth-last-child(2)').add('.addition-text:last-child').fadeIn(500);

      $(that).siblings('.addition-text').val('');

    }).fail(function () {
      flash.empty().show();
      flash.append('Try giving your addition some words!');
      flash.fadeOut(5000);
    });
  });


  //allows a blurb to close and open again
  var closeBlurb = function () {
    var toBeClosed = $('.open-blurb').find('.closed-story-blurb');
    setTimeout(function () {
      $(toBeClosed).fadeIn(500)
    }, 500);


    $('.open-blurb').find('.open-blurb-story').fadeOut(500)
      .end().find('.addition-form').fadeOut(500)
      .end().one('click', function () {
        closeBlurb();
        var that = this;

        $(this).find('.closed-story-blurb').fadeOut(500);
        setTimeout(function () {
          $(that).find('.open-blurb-story').fadeIn(500)
            .end().find('.addition-form').fadeIn(500)
            .end().addClass('open-blurb')
            .one('click', function () {
              closeBlurb()
            })
        }, 500)
      })
      .removeClass('open-blurb')
  };

  //sets up the first opening of a blurb
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

        $.each(story_array[0].sort().reverse(), function (index, addition) {

          var username;
          var userId;

          var startUserId = $(blurb).parents('.story-blurb').find('.story-blurb-username').attr('id');

          $.getJSON('/users', function (id) {

            if (startUserId == id) {
              var link = '<button class="button" id="addition-delete-button" data-method="delete" rel="nofollow" href="' + url + '/additions/' + addition.id + '">Delete</button>'
            }
            else {
              var link = ''
            }


            $.each(story_array[1], function (index, username_array) {
              if (username_array[0] == addition.id) {
                username = username_array[2];
                userId = username_array[1];
              }
            });

            $(addition_target).append(
                "<p class='addition-header'>Addition #" +
                (story_array[0].length - index) +
                  " by <a href='/users/" + userId + "' class='highlight-text'>" +
                  username +
                  '</a>, Created on: ' +
                  addition.created_at +
                  ' ' +
                  link +
                  '</p><p class="addition-text">' +
                  addition.addition_text +
                  '</p>'
            );

            delete_addition(addition_target);

          });

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