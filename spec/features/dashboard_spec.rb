require 'rails_helper'
require 'capybara/rails'

feature 'Dashboard' do
  scenario 'Can view created stories', js: true do
    start = create_start
    user = create_user
    login(user)

    expect(page)
  end
end