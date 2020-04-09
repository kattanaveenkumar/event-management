class SessionBookingsController < ApplicationController
  before_action :set_session_booking, only: [:create]

  def new
    @session_booking = SessionBooking.new
  end

  def create
    @session_booking = SessionBooking.create(event_session_id: params[:event_session_id], host_id: @event_session.host_id, user_id: current_user.id)
    redirect_to event_path(params[:event_id])
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def approvals
    @session_bookings = SessionBooking.all
  end

  def approve_or_reject
    @session_booking = SessionBooking.find(params[:id])
    @session_booking.update_column(:status, params[:commit] + "d")
    redirect_to session_bookings_approvals_path
  end

  private

  def set_session_booking
    @event_session = EventSession.find(params[:event_session_id])
  end

end
