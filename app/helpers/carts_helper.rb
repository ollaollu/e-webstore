module CartsHelper
	def cart_item(id)
		Product.find_by_id(id)
	end

	def item_total(quantity, price)
		quantity * price
	end

	def cart_count
		if session[:cart]
			session[:cart].length
		else
			0
		end
	end

end
