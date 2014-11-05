require 'rails_helper'

describe RootController do
  context 'show' do
    it 'renders the homepage for a new user' do
      get :show

      expect(response).to render_template(:show)
      expect(response).to render_template(layout: 'layouts/login')
    end

    it 'redirects a signed-in user' do
      user = create_user

      get :show, {}, {user_id: user.id}

      expect(response.status).to be(302)
    end
  end

  context 'new' do
    it 'creates a json object with all usernames' do
      user = create_user

      get :new

      body = JSON.parse(response.body)

      expect(body).to include(user.username)
    end
  end
end