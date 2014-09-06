class Follow < ActiveRecord::Base
  validates_presence_of :user_id, :user_followed_id

  belongs_to :user
  belongs_to :user, foreign_key: :user_followed_id

end
