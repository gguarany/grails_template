Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  resources :users, only: :index

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  ActiveSupport::Notifications.instrument 'routes_loaded.application'
end
