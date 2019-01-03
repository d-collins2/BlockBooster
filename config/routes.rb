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
  patch '/favorite', to: "favorite#update", as: :add_movie_to_favorite
end
