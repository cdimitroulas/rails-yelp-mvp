Rails.application.routes.draw do
  root to: "users#login"

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
  end

  resources :users, only: [:new, :create]
end
