class CheckoutsController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = 'Your account was successfully created.'
      		redirect_to checkout_payment_path
		else
			render :new
		end		
	end

	def payment
		
	end

	def payment_provider
		selection = params[:selection]

		if selection == "PayPal"

			redirect_to new_paypal_path

		elsif selection == "GooglePay"
			flash[:danger] = 'GooglePay not implemented yet.'

			redirect_to checkout_payment_path

		elsif selection == "CreditCard"

			redirect_to new_stripe_path
			
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :phone, :address, :country, :city)
	end
end
