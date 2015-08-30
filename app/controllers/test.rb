class CartProductsController < ApplicationController

  def index
    #if there is cart, pass to index to display else display empty value
  	if session[:id]
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

  def create
    id = params[:id]
    #if cart has been created, use existing cart else create new one
    if session[:cart]
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end

    #if product has been added, increment the value else set the value to 1
    if cart[id]
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end

  	redirect_to :controller => 'galleries', :action => 'index'
  end

  def destroy

  	redirect_to :controller => 'galleries', :action => 'index'
  end

  def clear
  	session[:cart] = nil

    redirect_to :controller => 'galleries', :action => 'index'
  end
end
