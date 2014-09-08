Rails.application.routes.draw do
  resource :dashboard, only: :show
  resource :session, only: [:create, :destroy, :show]
  resource :search, only: :show
  resources :starts, except: :index do
    resources :additions, except: [:index, :show]
  end

  resources :users, only: [:create, :show, :index] do
    resources :follows, only: :destroy
  end

  post '/users/:user_id/follows/:user_followed_id', to: 'follows#create'

  get '/usernames', to: 'root#new'

  root "root#show"
end
