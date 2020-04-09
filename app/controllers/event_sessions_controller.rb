class EventSessionsController < ApplicationController
  before_action :set_event, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event_session, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @event_session = @event.event_sessions.new
  end

  def create
    @event_session = @event.event_sessions.new(event_session_params)
    if @event_session.save
      flash[:success] = "Session has been created successfully"
      redirect_to event_path(@event.id)
    else
      flash[:error] = "Invalid form"
      render "new"
    end
  end

  def edit
  end

  def update
    if @event_session.update(event_session_params)
      flash[:success] = "Session has been created successfully"
      redirect_to event_path(@event.id)
    else
      flash[:error] = "Invalid form"
    end
  end

  def destroy
    @event_session.destroy
    redirect_to event_path(@event), notice: "Deleted successfully!" 
  end

  def view_attendees
    @attendees = SessionBooking.where(event_session_id: params[:event_session_id], host_id: current_user.id)
  end


  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_event_session
    @event_session = EventSession.find(params[:id])
  end

  def event_session_params
    params.require(:event_session).permit(:name, :description, :start_datetime, :end_datetime, :event_id, :host_id)
  end
end
