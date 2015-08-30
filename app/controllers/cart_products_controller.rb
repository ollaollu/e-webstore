class CartProductsController < ApplicationController

  def index
  	
  end
  
  def update
  	user.cart.manage_cart_item(item, values)

  	redirect_to :controller => 'galleries', :action => 'index'
  end

	
end
