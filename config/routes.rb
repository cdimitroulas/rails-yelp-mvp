Rails.application.routes.draw do
  get 'reviews/new'

  root to: "restaurants#index"

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end
end
