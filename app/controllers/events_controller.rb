class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to events_path, notice: "Successfully added!"
    else
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_sessions = (current_user.is_host?) ? EventSession.host_sessions(current_user.id) : @event.event_sessions 
    @session_booking = SessionBooking.new
    @session_bookings = SessionBooking.where(host_id: current_user.id)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "Event has been updated Successfully."
      redirect_to events_path
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event has been deleted Successfully"
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :image, :description, :venue_id, :city_id, :start_datetime, :end_datetime, :entry_fee, :status, :avatar, :address)
  end
end
