require 'rails_helper'

describe 'Start' do
  before do
    @user = create_user
  end

  it 'creates a valid start' do
    start = create_start(@user)

    expect(start).to be_valid
  end

  it 'validates presence of title' do
    start = create_start(@user, {title: ''})

    expect(start).to_not be_valid
  end

  it 'validates presence of story_text' do
    start = create_start(@user, {story_text: ''})

    expect(start).to_not be_valid
  end

  it 'validates presence of user_id' do
    start = create_start(@user, {user_id: ''})

    expect(start).to_not be_valid
  end

  it 'validates the length of the text' do
    start = create_start(@user, {story_text: "swore to shake it up, you swore to listen, oh we're still so young, desperate for attention, and i aim to be their eyes trophy boys trophy wives. a pause a pause no wait wait dear studio audience i have an announcement to make. it seems the artists these days are not who you think."})

    expect(start).to_not be_valid
  end

  it 'orders starts from newest to oldest' do
    start = create_start(@user)
    other_start = create_start(@user)

    expect(Start.first).to eq(other_start)

    start.update({title: 'tacks for snacks'})

    expect(Start.first).to eq(start)
  end
end