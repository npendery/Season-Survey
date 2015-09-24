Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users

  resources :categories, only: [:index, :show] do
    resources :items, only: [:new, :create, :show, :edit, :update]
  end

  resources :items, only: [:new, :create, :show, :edit, :update] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :reviews, only: [:index, :new, :create, :edit, :update]
end
