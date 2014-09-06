class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true

  has_many :starts
  has_many :additions
  has_many :follows
end
