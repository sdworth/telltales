require 'rails_helper'

describe 'Prompt' do
  it 'returns an array of three items' do
    expect(Prompt.get_array.length).to eq(3)
  end

  it 'returns a random word' do
    expect(Prompt.get_item.length > 0).to be_truthy
  end
end