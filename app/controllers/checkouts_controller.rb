class CheckoutsController < ApplicationController

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

end
