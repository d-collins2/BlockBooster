class TicketsController < ApplicationController

  def index
    if current_user
      @tickets = current_user.tickets
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def show

  end

  def new
    @ticket = Ticket.new
    @ticket.user = current_user
    @movies = Movie.all
  end

  def create
    @ticket = Ticket.new(movie_params)
    if @ticket.valid?
      @ticket.save
      redirect_to @ticket
    else
      redirect_to new_ticket_path
    end
  end

  def update
    add_movie_to_favorite(params[:movie_id])
    flash[:notice] = "Successfully added!"
    redirect_to movies_path
  end

  def movie_params
    params.require(:ticket).permit(:movie_id, :user_id)
  end
end
