Rails.application.routes.draw do
  resources :messages
  resources :rooms

  root 'rooms#index'

  #get '/auth/:provider/callback' => 'sessions#omniauth'
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login

end
