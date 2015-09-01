class Cart < Ohm::Model

  attribute :user_id

  collection :cart_products, :CartProduct

  index :user_id
  unique :user_id


  def manage_cart_item(product, options={})
    amount = options[:amount].blank? ? 1 : options[:amount].to_i
    amount_greater_than_or_eql_to_one = amount >= 1
    cart_product = find_cart_product(product.id)
    if cart_product
      if amount_greater_than_or_eql_to_one
        cart_product.update(amount: amount)
      else
        cart_product.delete
      end
    else
      CartProduct.create(
        item_id: product.id,
        amount: amount,
        price: product.price,
        name: product.name,
        cart: self
      ) if amount_greater_than_or_eql_to_one
    end
  end


  def find_cart_product(product_id)
    CartProduct[product_id]
  end


  def total_price
    total = 0
    cart_products.each do |cart_product|
      total += cart_product.price * cart_product.amount.to_f
    end
    @total_price ||= total
  end

  def paypal_url(return_url)   
      values = { 
      :business => ENV['paypal_business_account'],
          :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      }   
      cart_products.each do |item|
        values.merge!({ 
        "amount_1" => item.price,
        "item_name_1" => item.name,
        "item_number_1" => item.id,
        "quantity_1" => amount
        })
      end
      ENV['paypal_test_url'] + values.to_query         
  end  

end