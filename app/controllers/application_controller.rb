class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def require_user
  	unless current_user
      flash[:info] = "You need to login or signup before performing that action"
  		redirect_to login_path
  	end
  end

  def amount_in_cents(params)
    amount_value = (params * 100).to_i
    session[:amount] = amount_value
  end  

end
