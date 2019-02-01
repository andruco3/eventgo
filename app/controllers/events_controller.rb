class EventsController < ApplicationController
  # before_action :logged_in_user, only: [:index]
   before_action :logged_in_user, only: [:edit, :update, :destroy]

  def edit
    @event = Event.find(params[:id])
  end

  def index
    if logged_in?
      @events = current_user.events
    else
      redirect_to login_url
    end
  end

  def new
    @event = Event.new
  end

  def show
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Evento Creado Exitosamente!"
      redirect_to listEvent_url
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

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to listEvent_url
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    # flash[:success] = "Eventos eliminados"
    redirect_to listEvent_url
  end

  def event_params
    params[:user_id] = current_user.id
    params.require(:event).permit(:name, :place, :organizer,
                                 :description, :user_id)
  end
end
