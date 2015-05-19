Rails.application.routes.draw do
  resources :users
  resources :homes

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'sessions#new'
end
