class SessionsController < ApplicationController

  def create
  	@user = User.find_by_email(params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
  		session[:user_id] = @user.id
  		flash[:success] = "You have logged in successfully"
  		redirect_to root_path
  	else
  		flash[:danger] = "An error occured while logging you in"
  		redirect_to :back
  	end
  end

  def destroy
  	session[:user_id] = nil
    session[:cart] = nil
  	flash[:success] = "You have been logged out successfully"

  	redirect_to root_path
  end	

end
