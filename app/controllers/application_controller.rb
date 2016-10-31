class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :is_logged_in


  def is_logged_in
  	sign_out current_adminuser if (current_adminuser && user_signed_in?)
  	sign_out current_user if (current_user && adminuser_signed_in?)

  end
  	
end
