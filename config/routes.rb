Rails.application.routes.draw do
  resources :additions, except: [:index, :show]
  resource :dashboard, only: :show
  resource :session, only: [:create, :destroy, :show]
  resource :search, only: :show
  resources :starts, except: :index
  resources :users, only: [:create, :show]

  get '/usernames', to: 'root#new'

  root "root#show"
end
