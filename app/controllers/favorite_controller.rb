class FavoriteController < ApplicationController
  def update
    add_movie_to_favorite(params[:movie_id])
    flash[:notice] = "Successfully added!"
    redirect_to movies_path
  end
end
