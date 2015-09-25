Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users

  resources :categories, only: [:index, :show] do
    resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:index, :new, :create, :update, :edit]
  end

  resources :reviews, only: [:index, :new, :create, :edit, :update]

  resources :searches, only: [:index]
end
