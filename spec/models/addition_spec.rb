require 'rails_helper'

describe 'AdditionSpec' do
  before do
    @user = create_user

    @start = create_start(@user)
  end

  it 'should validate the presence of addition text' do
    addition = create_addition(@user, @start, {addition_text: ''})

    expect(addition.save).to be_falsey
  end

  it 'should validate the length of addition text' do
    addition = create_addition(@user, @start, {addition_text: "i just want to be better than your head's only medicine, i just want to be better than your head's only medicine. a downward spiral, just a pirouette. get-get-getting worse till there's nothing left. what good comes of something when i'm just the ghost of nothing?"})

    expect(addition.save).to be_falsey
  end

  it 'returns the user' do
    addition = create_addition(@user, @start, {user_id: @user.id})

    expect(addition.user).to be_truthy

    expect(addition.user.email).to eq(@user.email)
  end

  it 'returns the start' do
    addition = create_addition(@user, @start)

    expect(addition.start).to be_truthy

    expect(addition.start.id).to eq(@start.id)
  end


  it 'checks that the addition has a start' do
    addition = Addition.new({addition_text: 'a lack of sympathy, deficiency', user_id: 1})

    expect(addition.save).to be_falsey
  end

  it 'checks that the addition has a user' do
    addition = Addition.new({start_id: 1, addition_text: 'isnt this just fate and nothing more?'})

    expect(addition.save).to be_falsey
  end
end