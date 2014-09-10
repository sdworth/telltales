/**
 * Created by savannah on 8/15/14.
 */
var check_for_blank = function (that) {
  var blank = false;

  var inputs = $(that).parents('.focus').find('input');

  inputs.each(function () {
    if (this.value == '') {
      blank = true;
    }
  });

  if (blank) {
    $(that).parents('.focus').find('.button').attr('disabled', true)
  }
};


$(document).ready(function () {
  $('.register').on('click', function (e) {
    e.preventDefault();
    $('.login-block').toggle();
    $('.register-block').css('display', 'inline-block')
  });

  $('.login').on('click', function (e) {
    e.preventDefault();
    $('.login-block').toggle();
    $('.register-block').css('display', 'none')
  });


  // checks to see if username is available
  $('#register-form').find('#user_username').on('input', function () {
    var usernameField = this;
    var free = true;

    var promisedUsernames = $.getJSON('/usernames');

    promisedUsernames.success(function (usernames) {

      $.each(usernames, function (index, username) {
        if (username == usernameField.value) {
          free = false;
        }
      });

      if (!free) {
        $(usernameField).parents('.focus').find('.button').attr('disabled', true);
        $('.register-username-error').text('is already taken');
        $(usernameField).addClass('error-field')
      } else if (usernameField.value == '') {
        $(usernameField).addClass('error-field')
      } else  {
        $(usernameField).parents('.focus').find('.button').removeAttr('disabled');
        $(usernameField).removeClass('error-field');
        $('.register-username-error').text('')
      }

      check_for_blank(usernameField)
    });
  });

  //runs validations when disabled button is clicked
  $('.login-button-div').click(function () {
    if ($(this).find('.button').attr('disabled')) {

      var inputs = $(this).parents('.focus').find('input');

      $(inputs).addClass('error-field');
      $(inputs).parent('div').find('.errors').text('can\'t be blank');

      var blank = false;
      inputs.each(function () {
        if (this.value == '') {

          blank = true;
        } else {
          //        $(this).removeClass('error-field');
          $(this).parent('div').find('.errors').empty()
        }
      });

      if (!blank) {
        $(this).removeAttr('disabled')
      } else {
        $(this).attr('disabled', true)
      }
    }
  });

  //checks that password has been confirmed
  $('#user_password_confirmation').on('input', function () {
    var password = $(this).parents('.focus').find('#user_password');
    if (this.value != password[0].value) {
      $(this).addClass('error-field');
      $('.confirm-password-error').text('doesn\'t match');
      $(this).parents('.focus').find('.button').removeAttr('disabled')
    } else {
      $(this).removeClass('error-field');
      $('.confirm-password-error').text('');
      $(this).parents('.focus').find('.button').attr('disabled', true)
    }
  });


  //checks for blank fields
  $('.focus').find('input').on('input', function () {
    var allfields = $(this).parents('.focus').find('input');

    $(this).addClass('error-field');
    $(this).parent('div').find('.errors').text('can\'t be blank');

    var blank = false;
    allfields.each(function () {
      if (this.value == '') {
        blank = true;
      } else {
        $(this).removeClass('error-field');
        $(this).parent('div').find('.errors').empty()
      }
    });

    if (!blank) {
      $(this).parents('.focus').find('.button').removeAttr('disabled')
    } else {
      $(this).parents('.focus').find('.button').attr('disabled', true)
    }

//    checks for other form errors
    var errorText = $(this).parents('.focus').find('.register-username-error');
    if (errorText[0].innerText == 'is already taken') {
      $(errorText).siblings('input').addClass('error-field');
      $(this).parents('.focus').find('.button').attr('disabled', true)
    }

  });
});