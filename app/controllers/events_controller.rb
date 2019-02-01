class EventsController < ApplicationController
  # before_action :logged_in_user, only: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


  def event_params
    params.require(:event).permit(:name, :place, :organizer,
                                 :description)
  end
end
