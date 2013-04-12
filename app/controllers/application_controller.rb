class ApplicationController < ActionController::Base
  protect_from_forgery
  
   	def authorize
	  unless user_signed_in?
	  	redirect_to login_path, :method => :get, :notice => "Please login."
	  end
	end

	def authorize_admin
	  unless current_user.admin?
	  	redirect_to root_url, :notice => "You don't have the permissions."
	  end
    end
	
  private
end
