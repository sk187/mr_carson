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
  get '/login_admin', to: 'admin_sessions#new'
  post '/login_admin', to: 'admin_sessions#create'
  get '/logout_admin', to: 'admin_sessions#destroy'
  resources :admins
end
