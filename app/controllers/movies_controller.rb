class MoviesController < ApplicationController
  def index
    @movies = if params[:search]
                Movie.search(params[:search]).order('name')
              else
                Movie.now_playing.sort_by(&:release_date).reverse
              end
  end

  def upcoming
    @upcoming = Movie.upcoming.sort_by(&:release_date)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :release_date, :overview, :image, :image2, :search)
  end
end
