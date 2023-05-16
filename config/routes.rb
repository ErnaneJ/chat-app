Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  
  resources :users

  root 'rooms#index'

  get 'rooms/index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end