Rails.application.routes.draw do
  resource :dashboard, only: :show
  resource :session, only: :create
  resources :users, only: :create

  root "root#show"
end
