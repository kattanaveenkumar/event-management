class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
	events_path
  end

  # rescue_from CanCan::AccessDenied do 
  # 	redirect_to root_path, alert: "You are not authorized to access this section!"
  # end
end
