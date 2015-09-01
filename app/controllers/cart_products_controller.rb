class CartProductsController < ApplicationController

  def index
    @cart = Cart.new
  	@cart_products = current_user.cart_products
  end
  
  def update
    current_user.Cart.manage_cart_item(@product, params)   
  end

  def remove
    current_user.Cart.find_cart_product(@product.id).try(:delete)
  end 
	
end
