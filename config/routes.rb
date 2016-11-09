Rails.application.routes.draw do

  root to: "restaurants#index"

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
  end

  # Routes for signing up a new user
  get "/signup", to: 'users#new'
  post '/users', to: 'users#create'

  # Routes for logging in/out etc.
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Namespace for user-specific actions
  namespace :creator do
    resources :restaurants, only: [:edit, :update, :destroy] do
      resources :reviews, only: [:edit, :update]
    end
  end

end
