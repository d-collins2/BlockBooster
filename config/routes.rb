Rails.application.routes.draw do
  resources :tickets
  resources :movies
  root 'movies#index'
  devise_for :users
  resources :users
end
