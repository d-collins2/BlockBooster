Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get :favorite
    end
  end
  resources :tickets
  resources :movies do
    collection do
      get :upcoming
    end
  end
  root 'movies#index'

end
