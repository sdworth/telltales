class Search
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def starts
    @starts ||= Start.where("title ILIKE '%#{@string}%'")
  end

  def users
    @users ||= User.where("username ILIKE '%#{@string}%'")
  end
end