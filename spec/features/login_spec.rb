require 'rails_helper'
require 'capybara/rails'

feature 'Login' do
  scenario 'can register' do
    register
  end

  scenario 'can login' do
    login

  end

  def register
    visit "/"
    within '.register-block' do
      fill_in 'user_username', with: 'user'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      fill_in 'user_email', with: 'user@example.com'
      click_button 'Register'
    end
  end

  def login
    register

    within '.login-block' do
      fill_in 'user_username', with: 'user'
      fill_in 'user_password', with: 'password'
      click_button "Login"
    end
    expect(page).to have_content 'Dashboard'
  end
end