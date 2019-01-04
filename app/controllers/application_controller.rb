class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def favorites
    session[:favorite] ||= []
  end

  def add_movie_to_favorite(movie_id)
    Ticket.create(user_id: current_user.id, movie_id: movie_id)
  end

  def favorite_movies
    @favorite_movies = Ticket.all.sort_by { ticket | ticket.movie.name }
  end

  def delete_favorites(ticket)
    favorite_movies.find(ticket).pop
  end
end
