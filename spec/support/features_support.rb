def register
  visit "/"
  click_on 'Register'
  within '.register-block' do
    fill_in 'user_username', with: 'user'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_email', with: 'user@example.com'
    click_button 'Register'
  end
end

def login(user)
  visit '/'

  within '.login-block' do
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_button "Login"
  end

  expect(page).to have_content 'Dashboard'
end