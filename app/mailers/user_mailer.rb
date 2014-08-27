class UserMailer < ActionMailer::Base
  default from: "no-reply@telltales.com"

  #call the deliver method after the message name
    #User_mailer.login_email(@user).deliver
  def welcome_email(user)
    @user = user
    @url = root_url

    mail(to: @user.email, subject: "Welcome to TellTales!")
  end
end
