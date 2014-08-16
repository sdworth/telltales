class RootController < ApplicationController
  def show
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
end