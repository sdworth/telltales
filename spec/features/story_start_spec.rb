require 'rails_helper'
require 'capybara/rails'

feature 'story creation', js: true do
  scenario 'can create a story' do
    user = create_user

    login(user)

    visit '/starts/new'

    fill_in 'start_title', with: "ain't it fun?"
    fill_in 'start_story_text', with: "i don't mind, letting you down easy. just give it time."

    click_on 'Create Story'

    expect(page).to have_content('Dashboard')
    expect(page).to have_content("Story 'ain't it fun?' created")
  end
end