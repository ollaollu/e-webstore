class StripesController < ApplicationController
	before_action :require_user

	def new
		@amount = params[:amount]
		@amount_in_cents = amount_in_cents(params[:amount])
	end

	def create		
		# Amount in cents
	    #amount = params[:stripeAmount] * 100
	    amount = session[:amount] * 100
	 
	    # Create the customer in Stripe
	    customer = Stripe::Customer.create(
	      email: params[:stripeEmail],
	      card: params[:stripeToken]
	    )
	 
	    # Create the charge using the customer data returned by Stripe API
	    charge = Stripe::Charge.create(
	      customer: customer.id,
	      amount: amount,
	      description: 'Alpha watches customer',
	      currency: 'usd'
	    )

		flash[:success] = 'You placed an order!'
	    
	    #creates order, order products and payment log
	    order_log_actions	    	    
	 
	    # place more code upon successfully creating the charge
	  	rescue Stripe::CardError => e
	    flash[:error] = e.message
	    redirect_to new_stripe_path
	    flash[:notice] = "Please try again"
	end

	def order_log_actions
		create_order
		create_order_products

		session[:cart] = nil

		redirect_to gallery_path		
	end

	def create_order
		Order.create(user_id: current_user.id, shipping_address: current_user.address, telephone: current_user.phone, payment_gateway: "stripe")
	end	

	def create_order_products
		shopping_cart = session[:cart]

		shopping_cart.each do |id, quantity|
			product = Product.find_by_id(id)

			name = product.name
			price = product.price
			amount = quantity
			product_id = id

			OrderProduct.create(user_id: current_user.id, product_id: product_id, amount: amount, price: price, name: name)
		end
	end

end
