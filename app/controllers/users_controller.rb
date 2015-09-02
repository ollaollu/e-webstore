class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = 'Your account was successfully created.'
      		redirect_to root_path
		else
			flash[:error] = 'There was an error creating your account'
			render :new
		end		
	end	


	private

	def user_params
		params.require(:user).permit(:name, :email, :phone, :address, :country, :city, :password, :password_confirmation)
	end	
end
