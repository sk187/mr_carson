Rails.application.routes.draw do
  resources :users
  resources :homes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'sessions#new'

  scope controller: :static_pages do
    get :food
    get :sights
    get :manor_guide
  end
  get '/admin', to: 'admins#index'
  resources :control_panel
  resources :admins
end
