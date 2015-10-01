Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users

  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end

  resources :items, except: [:index] do
    resources :reviews, except: [:show]
  end

  resources :reviews do
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end

  resources :searches, only: [:index]

  resources :users, only: [:index, :update, :destroy]
end
