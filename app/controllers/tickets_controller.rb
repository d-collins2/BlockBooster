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
    @ticket = Ticket.create(movie_params)
    redirect_to @ticket
  end

  def movie_params
    params.require(:ticket).permit(:movie_id, :user_id)
  end
end
