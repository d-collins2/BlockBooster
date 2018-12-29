class UsersController < ApplicationController
  def new

  end

  def edit
    @user = User.find(params[:id])
  end

  def show

  end

  def update
    # @user = User.find(params[:id])
    # @user.update(u)
  end
end
