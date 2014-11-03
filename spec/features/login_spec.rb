require 'rails_helper'
require 'capybara/rails'

feature 'Login' do
  scenario 'can register', js: true do
    register
  end

  scenario 'can login', js: true do
    register

    within '.login-block' do
      fill_in 'user_username', with: 'user'
      fill_in 'user_password', with: 'password'
      click_button "Login"
    end
    expect(page).to have_content 'Dashboard'
  end

  scenario 'created login works', js: true do
    user = create_user

    visit '/'

    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password

    click_on 'Login'

    expect(page).to have_content 'Dashboard'


    #login(user)
  end
end