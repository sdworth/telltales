Rails.application.routes.draw do
  root "login#index"

  post '/login/new' => 'login#create'
  post '/login' => 'login#login'

  get '/dashboard' => 'starts#index'
  resources :starts
end
