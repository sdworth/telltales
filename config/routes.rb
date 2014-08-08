Rails.application.routes.draw do
  root "login#index"

  resources :login
end
