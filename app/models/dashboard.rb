class Dashboard
  def initialize(user)
    @user = user
  end

  def get_starts
    unless @start
      followees = @user.follows

      ids = (
      @user.starts +
        @user.addition_starts +
        followees.map { |follow|
          follow.followee.starts + follow.followee.addition_starts
        }
      ).flatten.uniq

      @start = Start.where(id: ids)
    else
      @start
    end
  end
end