class Cart < Ohm::Model

  attribute :user_id

  collection :cart_products, :CartProduct

  index :user_id
  unique :user_id

  # Manage cart item
  #
  # @note Add or removes items to the user cart, if cart item exist it updates it, otherwise
  # it creates the item in the shopping cart.
  # @note In case the amount is 0 then the item is going to be deleted from the cart
  def manage_cart_item(item, options={})
    amount = options[:amount].blank? ? 1 : options[:amount].to_i
    measure_item = item.measure_items.find_by(id: options[:measure_item_id]) || item.measure_items.primary
    amount_greater_than_or_eql_to_one = amount >= 1
    cart_item = find_cart_item(item.id, measure_item.id)
    if cart_item
      if amount_greater_than_or_eql_to_one
        cart_item.update(amount: amount)
      else
        cart_item.delete
      end
    else
      CartProduct.create(
        item_id: item.id,
        measure_item_id: measure_item.id,
        amount: amount,
        amount_with_measure_name_and_price: measure_item.amount_with_measure_name_and_price,
        price: measure_item.price,
        name: item.name,
        cart: self,
        created_at: Time.now
      ) if amount_greater_than_or_eql_to_one
    end
  end

  # Find cart item
  #
  # @note Find the cart item by item id and cart id
  def find_cart_item(item_id, measure_item_id)
    CartProduct.with(:item_id_measure_item_id_shopping_cart_id, "#{item_id}_#{measure_item_id}_#{id}")
  end

  # Total price
  #
  # @note Calculate the total items price based on the item price and the amount
  # @return [BigDecimal]
  def total_price
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.price * cart_item.amount.to_f
    end
    @total_price ||= total
  end

end