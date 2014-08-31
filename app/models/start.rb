class Start < ActiveRecord::Base
  validates :title, :story_text, :user_id, presence: true
  validates :user_id, numericality: true
  validates :story_text, length: {maximum: 140}

  belongs_to :user
  has_many :additions
end
