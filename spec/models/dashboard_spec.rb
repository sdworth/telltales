require 'rails_helper'

describe Dashboard do
  it 'returns stories a user or their followees have contributed to' do
    user = create_user
    other_user = create_other_user
    third_user = create_third_user

    Follow.create({user_id: user.id, user_followed_id: other_user.id})

    start_user_created = create_start(user)

    start_user_contributed_to = create_start(third_user)
    create_addition(start_user_contributed_to)

    start_followee_created = create_start(other_user)

    start_followee_contributed_to = create_start(third_user)
    create_addition(start_followee_contributed_to)

    dash = Dashboard.new(user).get_starts

    expect(dash).to include(start_followee_contributed_to)
    expect(dash).to include(start_user_contributed_to)
    expect(dash).to include(start_followee_created)
    expect(dash).to include(start_user_created)

    expect(dash.length).to eq(4)
  end
end