Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users
  resources :categories, only: [:index]
  resources :items, only: [:index]
end
