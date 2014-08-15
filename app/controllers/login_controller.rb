class LoginController < ApplicationController

  def index
    @sample_text = "Permanent jet lag
Please take me back (Please take me back)
Please take me back
I'm a stray dog sick
Please let me in (Please let me in)
The mad key's tripping
singing vows before we exchange smoke rings
Call me, mr bezendrine
but don't let the doctor in I wanna blow off steam and "
    @user = User.new
    @register_check = User.all.collect {|user| user.username}
  end

  def create
    @user = User.new(
      email: params[:email],
      username: params[:username],
      password: params[:password]
    )
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def login
    @user = User.find_by(
      username: params[:username]
    )
    redirect_to "/dashboard"
  end
end