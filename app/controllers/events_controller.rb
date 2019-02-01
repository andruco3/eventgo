class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def show
    @event = Event.all
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


  def event_params
    params.require(:event).permit(:name, :place, :organizer,
                                 :description)
  end
end
