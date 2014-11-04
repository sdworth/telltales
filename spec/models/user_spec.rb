require 'rails_helper'

describe User do
  it 'creates a valid user' do
    user = create_user

    expect(user.save).to be_truthy
  end

  it 'validates presence of password' do
    user = User.new({username: 'charles', email: 'x@men.com', password: ''})

    expect(user.save).to be_falsey
  end

  it 'validates presence of username' do
    user = create_user({username: ''})

    expect(user).to_not be_valid
  end

  it 'validates presence of email' do
    user = create_user({email: ''})

    expect(user).to_not be_valid
  end

  it 'returns the stories a user has contributed to' do
    user = create_user
    other_user = create_other_user
    start = create_start(other_user)
    create_addition(user, start)

    expect(user.addition_starts.first).to eq(start)
  end
end