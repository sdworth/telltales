require 'rails_helper'

describe Search do
  before do
    @user = create_user
    @start = create_start(@user)
  end

  it 'returns the starts' do
    search = Search.new(@start.title.upcase)

    expect(search.starts).to include(@start)
  end

  it 'only returns matching starts' do
    search = Search.new('IDONTMATCHANYTHING')

    expect(search.starts.length).to eq(0)
  end

  it 'returns the search string' do
    search = Search.new('test')

    expect(search.string).to eq('test')
  end

  it 'returns the users' do
    search = Search.new(@user.username.upcase)

    expect(search.users).to include(@user)
  end

  it 'only returns matching users' do
    search = Search.new('IDONTMATCHANYTHING')

    expect(search.users.length).to eq(0)
  end
end