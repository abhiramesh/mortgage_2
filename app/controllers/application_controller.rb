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

  def after_sign_in_path_for(resource)
  	if current_user.email == "vpujji@gmail.com"
  		'/users'
  	else
  		'/logout'
  	end
  end

  def authorize
  	if current_user
	  	unless current_user.email == "vpujji@gmail.com"
	  		redirect_to new_user_session_path
	  	end
	else 
		redirect_to new_user_session_path
	end
  end

end
