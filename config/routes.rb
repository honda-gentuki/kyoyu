Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'posts#index'
  resources :posts do
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: :show do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :chats, only: [:index, :show, :create]
  resources :notifications, only: :index
end
