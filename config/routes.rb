Rails.application.routes.draw do
concern :searchable do
  collection do
    get :search
  end
end

  devise_for :users
  resources :users do
    collection do
      get :favorite
    end
  end
  resources :tickets
  resources :movies do
    collection do
      get :upcoming, :now_playing_foreign, :upcoming_foreign
    end
  end
  root 'movies#index'
  patch '/favorite', to: "favorite#update", as: :add_movie_to_favorite
end
