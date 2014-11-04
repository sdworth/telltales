class Follow < ActiveRecord::Base
  validates_presence_of :user_id, :user_followed_id

  belongs_to :user
  belongs_to :followee, class_name: 'User', foreign_key: :user_followed_id
end
