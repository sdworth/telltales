require 'rails_helper'

describe SearchesController do
  it 'shows the search' do
    user = create_user

    get :show, {search: 'searching!'}, {user_id: user.id}

    expect(response.status).to be(200)

    expect(response).to render_template(:show)
  end
end
