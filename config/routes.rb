Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :users
  root 'users#index'

  #get '/auth/:provider/callback' => 'sessions#omniauth'
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login

end
