class Start < ActiveRecord::Base
  validates_presence_of :title, :story_text, :user_id
  validates_length_of :story_text, maximum: 140

  belongs_to :user
  has_many :additions

  default_scope {order(updated_at: :desc)}
end
