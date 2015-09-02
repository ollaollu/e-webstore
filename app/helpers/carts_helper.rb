module CartsHelper
	def cart_item(id)
		product = Product.find_by_id(id)
	end

	def item_total(quantity, price)
		total = 0
		total += quantity * price
	end

	def cart_count
		if session[:cart]
			session[:cart].length
		else
			0
		end
	end

end
