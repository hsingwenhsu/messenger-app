Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :users
  root 'users#index'

end
