class MoviesController < ApplicationController
  def index
    @movies = if params[:search]
                Movie.search(params[:search]).order('name')
              else
                Movie.now_playing.sort_by(&:release_date).reverse
              end
  end

  def upcoming
    @upcoming = if params[:search]
                  Movie.search(params[:search]).order('name')
                else
                  Movie.upcoming.sort_by(&:release_date)
                end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def now_playing_foreign
    @movies = if params[:search]
                Movie.search(params[:search]).order('name')
              else
                Movie.now_playing_foreign.sort_by(&:release_date).reverse
              end
  end

  def upcoming_foreign
    @upcoming = if params[:search]
                  Movie.search(params[:search]).order('name')
                else
                  Movie.for_upcoming.sort_by(&:release_date)
                end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :release_date, :overview, :image, :image2, :search)
  end
end
