require 'rails_helper'

describe 'Follow' do
  it 'should validate the presence of a user' do
    follow = Follow.new({user_followed_id: 1})

    expect(follow.save).to be_falsey

    expect(follow.errors.full_messages.length)
  end

  it 'should validate the presence of the user followed' do
    follow = Follow.new({user_id: 1})

    expect(follow.save).to be_falsey
  end
end