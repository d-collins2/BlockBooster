class TicketsController < ApplicationController
  def index
    if current_user
      @tickets = current_user.tickets
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def new; end

  def create
    @ticket = Ticket.new
    @ticket.save
    redirect_to movies_path
  end

end
