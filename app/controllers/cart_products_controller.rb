class CartProductsController < ApplicationController

  def index
    if session[:cart]
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

  def add
    id = params[:id]
    product = Product.find_by_id(id)

    if session[:cart]
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    if cart[id]
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end
    puts "present: #{session[:cart]}"
    puts "total cart items: #{session[:cart].length}"

    flash[:success] = "#{product.name} added to cart"
    redirect_to :back
  end

  def remove
    id = params[:id]
    product = Product.find_by_id(id)

    if session[:cart].has_key?(id)
      if session[:cart][id] > 1
        session[:cart][id] = session[:cart][id] - 1
      else
        session[:cart].delete(id)
      end
      
      flash[:success] = "#{product.name} removed from cart"
      redirect_to :back       
    else
      flash[:info] = "#{product.name} is not in cart"
      redirect_to :back 
    end  

    puts "present: #{session[:cart]}"  
   
  end

  def empty_cart
    session[:cart] = nil
    flash[:success] = "You have successfully emptied your cart."

    redirect_to cart_path
  end
	
end
