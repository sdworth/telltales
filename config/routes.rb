Rails.application.routes.draw do
  resource :dashboard, only: [:show]
  resource :session, only: [:create, :destroy, :show]
  resource :search, only: [:show]
  resources :starts, except: [:index] do
    resources :additions, except: [:index, :show], shallow: true
  end
  resources :users, except: [:new, :destroy]

  resources :follows, only: [:destroy]
  post 'follows/:id', to: 'follows#create'

  get '/usernames', to: 'root#new'
  get '/prompt', to: 'starts#prompt', as: :prompt

  root "root#show", via: :get
end
