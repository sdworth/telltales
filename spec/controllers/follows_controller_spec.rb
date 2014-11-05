require 'rails_helper'

describe FollowsController do
  before do
    @user = create_user
  end

  context 'create' do
    it 'successfully creates a follow' do
      post :create, {id: 0}, {user_id: @user.id}

      follow = JSON.parse(response.body)

      expect(follow['user_id']).to eq(@user.id)
      expect(follow['user_followed_id']).to eq(0)
    end

    it 'raises an error for an invalid follow' do
      expect {
        post :create, {id: ''}, {user_id: @user.id}
      }.to raise_error(RuntimeError)
    end
  end

  context 'destroy' do
    it 'successfully deletes a follow' do
      Follow.create({user_id: @user.id, user_followed_id: 0})

      delete :destroy, {id: 0}, {user_id: @user.id}

      follow = JSON.parse(response.body)

      expect(follow['user_id']).to eq(@user.id)
      expect(follow['user_followed_id']).to eq(0)
    end

    it 'raises an error for a nonexistent follow' do
      expect {
        delete :destroy, {id: 0}, {user_id: @user.id}
      }.to raise_error(RuntimeError)
    end
  end
end