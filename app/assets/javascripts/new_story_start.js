/**
 * Created by savannah on 8/25/14.
 */

$(document).ready(function () {

  $('#prompt-generator').click(function () {
    var promiseOfWords = $.getJSON('/starts/new')
      .success(function (words) {
        console.log(words);

        var prompt_target = $('#prompt-target');
        $(prompt_target).empty();
        prompt_target.append(words.join(" "));
      })
      .fail(function (words) {
        console.log(words.responseText);
      });
  });

  //gives can't be blank errors
  $('#new_start .textfield').on('input', function () {
    console.log('check');
    var text = $('#start_story_text');
    var title = $('#start_title');

    if (text.val() != '' && title.val() != '') {
      $('#new_start .button').removeAttr('disabled')
    } else {
      $('#new_start .button').attr('disabled', true)
    }
  });

  $('#new_start #button-div').click(function () {
    if ($(this).find('.button').attr('disabled') == 'disabled') {
      if ($('#start_story_text').val() == '') {
        $('#start_story_text').siblings('.error-message').append('can\'t be blank')
          .end().addClass('error-field').on('input', function(){
            $(this).removeClass('error-field').siblings('.error-message').empty()
          })

      }
      if ($('#start_title').val() == '') {
        $('#start_title').siblings('.error-message').append('can\'t be blank')
          .end().addClass('error-field').on('input', function(){
            $(this).removeClass('error-field').siblings('.error-message').empty()
          })
      }
    }
  });


  //handles length for story text
  $('#start_story_text').on('input', function () {
    $('#remaining-characters').empty();

    var chars = 140 - $(this).val().length;
    if (chars < 0) {
      $('#remaining-characters').append(0);
    }
    else {
      $('#remaining-characters').append(chars)
    }

    if ($(this).val().length > 140) {
      this.value = this.value.substring(0, 140)
    }
  });

});