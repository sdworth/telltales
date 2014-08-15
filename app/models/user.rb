class User < ActiveRecord::Base
  validates :password, presence:true, confirmation: true
  validates :username, presence: true
  validates :email, presence: true
end
