require 'rails_helper'

describe AdditionsController do
  before do
    @user = create_user
    @start = create_start(@user)
  end

  context 'create' do
    it 'successfully saves valid addition' do
      post :create, {start_id: @start.id, addition: {addition_text: 'i can breathe, water, water'}}, {user_id: @user.id}

      body = JSON.parse(response.body)

      expect(body[1]).to eq(@user.username)

      expect(body.last).to eq(@user.id)
    end

    it 'raises an error for an invalid addition' do
      expect {
        post :create, {start_id: @start.id, addition: {addition_text: ''}}, {user_id: @user.id}
      }.to raise_error
    end
  end

  context 'destroy' do
    it 'successfully deletes an addition' do
      addition = create_addition(@user, @start)

      delete :destroy, {id: addition.id}, {user_id: @user.id}

      expect(response.status).to eq(200)

      body = JSON.parse(response.body)

      expect(body['addition_text']).to eq(addition.addition_text)
    end

    it 'unsuccessfully deletes an addition' do
      addition = create_addition(@user, create_start(create_other_user))

      expect {
        delete :destroy, {id: addition.id}, {user_id: @user.id}
      }.to raise_error
    end
  end
end