class Addition < ActiveRecord::Base
  validates :addition_text, presence: true, length: {maximum: 140}

  belongs_to :user
  belongs_to :start
end
