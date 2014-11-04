class Addition < ActiveRecord::Base
  validates :addition_text, presence: true, length: {maximum: 140}
  validates_presence_of :user_id, :start_id

  belongs_to :user
  belongs_to :start
end
