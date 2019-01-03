class MoviesController < ApplicationController
  
  def index
    @movies = Movie.now_playing.sort_by {|movie| movie.release_date }.reverse
    render :index
  end

  def upcoming
    @upcoming = Movie.upcoming.sort_by {|movie| movie.release_date }
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
