Rails.application.routes.draw do
  resource :dashboard, only: :show
  resource :session, only: [:create, :destroy, :show]
  resources :starts
  resources :users, only: :create

  get '/usernames', to: 'root#new'
  root "root#show"
end
