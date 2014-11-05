require 'rails_helper'

describe DashboardsController do
  it 'properly renders the dashboard' do
    user = create_user

    get :show, {}, {user_id: user.id}

    expect(response).to render_template(:show)
  end
end