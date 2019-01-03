class UsersController < ApplicationController
  before_action :favorite_movies, only: [:show]
  def new

  end

  def show
    @user = User.find(params[:id])
  end
end
