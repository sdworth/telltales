/**
 * Created by savannah on 8/25/14.
 */

$(document).ready(function () {

  $('#prompt-generator').click(function () {
    var promiseOfWords = $.getJSON('/starts/new');

    console.log(promiseOfWords);

    promiseOfWords.success(function (words) {
      console.log('here');
      console.log(words);

      var prompt_target = $('#prompt-target');
      $(prompt_target).empty();
      prompt_target.append(words);
    });
  });

  //gives can't be blank errors
  $('#new_start .textfield').on('input', function () {
    var text = $('#start_story_text');
    var title = $('#start_title');

    if (text.val() != '' && title.val() != '') {
      $('#new_start .button').removeAttr('disabled')
    }
  });

  $('#new_start .button').click(function () {
    if (this.attr('disabled') == 'disabled') {
      if ($('#start_story_text').val() == '') {
        $('#start_story_text').addClass('error-field')
      } else if ($('#start_title').val() == '') {
        $('#start_title').addClass('error-field')
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