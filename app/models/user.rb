class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true

  has_many :starts
  has_many :additions
  has_many :starts, through: :additions
  has_many :follows
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def addition_starts
    addition = Addition.where(user_id: id).map{|addition| addition.start_id unless addition.start.user_id == id}.uniq

    Start.where(id: addition)
  end
end
