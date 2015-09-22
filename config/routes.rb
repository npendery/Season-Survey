Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users

  resources :items, only: [:new, :create, :show]
  resources :categories, only: [:index]
end
