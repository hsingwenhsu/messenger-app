Rails.application.routes.draw do
  resources :events
  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
  if not ENV['CUCUMBER_TESTING'].nil? and ENV['CUCUMBER_TESTING'] == "ENABLED"
    post "/pseudo_google_oauth" => "testing#registration"
  end
  resources :testing
  #devise_for :admins
  resources :messages
  resources :rooms
  #resources :users
  resources :enrollments
  #root 'users#index'

end
