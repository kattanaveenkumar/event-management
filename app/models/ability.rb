class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Event
    elsif user.role? "admin"
      can :manage, :all
    elsif user.role? "host" 
      can [:update, :destroy], Event do |event|
        event.try(:user) == user
      end
      can [:create, :read], Event
      can [:read, :view_attendees], EventSession
      can :read, SessionBooking
    elsif user.role? "attendee"
      can :read, Event
      can :read, EventSession
      can :create, SessionBooking
    end
    end
end
