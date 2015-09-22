Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :items, only: [:new, :create, :show]
end
