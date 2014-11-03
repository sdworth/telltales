require 'rails_helper'
require 'capybara/rails'

feature 'Login' do
  scenario 'cannot login with nonexistant user', js: true do
    visit '/'

    within '.login-block' do
      fill_in 'user_username', with: 'Pyrrha'
      fill_in 'user_password', with: 'Nikos'
      click_button 'Login'
    end

    expect(page).to have_content('Username or password is incorrect!')
  end

  scenario 'gives taken username error', js: true do
    user = create_user

    visit '/'

    click_on 'Register'

    fill_in 'Username', with: user.username

    expect(page).to have_content('Username is already taken')
  end

  scenario "gives password doesn't match error", js: true do
    visit '/'

    click_on 'Register'

    fill_in 'user_password', with: 'right'
    fill_in 'user_password_confirmation', with: 'wrong'

    expect(page).to have_content("Confirm password doesn't match")
  end
end