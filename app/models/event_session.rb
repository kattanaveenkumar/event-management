class EventSession < ApplicationRecord
  belongs_to :event
  has_many :session_bookings

  scope :host_sessions, -> (user_id){ where(host_id: user_id)}

  validates :name, :start_datetime, :end_datetime, :host_id, presence: true

  def is_enrolled?(user)
  	SessionBooking.where(event_session_id: self.id, user_id: user.id).present?
  end
end
