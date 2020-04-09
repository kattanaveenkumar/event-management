class SessionBooking < ApplicationRecord
  belongs_to :user
  belongs_to :event_session
  after_create :update_status

  STATUSES = {approved: "Approved", rejected: "Rejected", pending: "Pending"}.freeze
  
  scope :requests, ->{ where(status: STATUSES[:pending])}


  def update_status
  	self.update_attribute(:status, STATUSES[:pending])
  end

  def host
  	User.find(self.host_id)
  end
  
  def is_approved?
  	self.status == STATUSES[:approved]
  end
end
