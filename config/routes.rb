Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users_admin, only: [:index, :show, :edit, :update, :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  ActiveSupport::Notifications.instrument 'routes_loaded.application'
end
