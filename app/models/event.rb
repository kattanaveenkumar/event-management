class Event < ApplicationRecord
  has_many :event_sessions, dependent: :destroy
  belongs_to :user
  
  validates :name, :start_datetime, :end_datetime, :image, :address, presence: true
  before_create :check_date

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private 

  def check_date
    if self.start_datetime >= self.end_datetime
      errors.add(:start_datetime," is invalid!")	
    end
  end	
end
