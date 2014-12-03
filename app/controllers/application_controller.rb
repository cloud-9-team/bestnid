class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_admin
 
	def set_admin
	  @admin = User.where(email: "admin1_bestnid@gmail.com").first
	end

end
