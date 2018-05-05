Rails.application.routes.draw do

  root to: "home#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:index, :edit, :update, :new, :create, :destroy]
  resources :users, only: [:index, :edit, :update, :new, :create, :destroy]
  resources :surveys, only: [:index, :edit, :update, :new, :create, :destroy] do
    resources :results, only: [:new, :create]
  end
end
