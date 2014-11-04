require 'rails_helper'
require 'capybara/rails'

feature 'Dashboard' do
  scenario 'Can view created stories', js: true do
    user = create_user
    start = create_start(user)
    login(user)

    expect(page).to have_content(start.story_text)
  end
end