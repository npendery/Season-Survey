Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users

  resources :categories, only: [:index, :show] do
    resources :items, only: [:new, :create, :show]
  end

  resources :items, only: [:new, :create, :show] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :reviews, only: [:index, :new, :create]
end
