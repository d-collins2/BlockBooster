Rails.application.routes.draw do
  resources :tickets
  resources :movies
  get 'home/index'
  root 'home#index'
  devise_for :users
  resources :users, only: [:index, :edit, :update]
end
