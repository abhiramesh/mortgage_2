class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_out_path_for(resource)
  	if current_user
	  	if current_user.phone != nil
	  		thanks_path
	  	else
	  		root_path
	  	end
	else
		root_path
	end
  end

end
