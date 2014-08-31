/**
 * Created by savannah on 8/27/14.
 */
var closeBlurb = function () {
  $('.open-blurb')
    .find('.open-blurb-story').fadeOut(500)
    .end().find('closed-story-blurb') //.setTimeout(function(){ $(this).fadeIn(500)}, 500)
    .end().removeClass('open-blurb')
};

$(document).ready(function () {

  $('.blurb-story').click(function (e) {
    e.preventDefault();
    var blurb = this;

    var url = $(this).attr('href');
    $.getJSON(url, function (story_array) {

      closeBlurb();

      $(blurb).find('closed-story-blurb').fadeOut(500);

      $(blurb).parent('.story-blurb').addClass('open-blurb');

      setTimeout(function () {
        console.log('ran');
        $(blurb).find('.addition-form').before(
            '<div class="open-blurb-story">' +
            '<p>hi</p>' +
            '</div>'
        );
      }, 500);

      $('.open-blurb-story').click(function (e) {
        e.preventDefault();
        console.log('clicked');
        closeBlurb()
      });
    }).success();
  });


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