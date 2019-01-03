class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def favorites
    session[:favorite] ||= []
  end

  def add_movie_to_favorite(movie_id)
    favorites << movie_id
  end

  def favorite_movies
    @favorite_movies = Movie.find(favorites)
  end
end
