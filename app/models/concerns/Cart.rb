module Cart
  extend ActiveSupport::Concern

  def cart_products_count
    cart_products.count
  end

  def products_from_cart
    Product.with_deleted.where(id: cart_products.map(&:item_id))
  end

  def cart_products
    cart.cart_products
  end

  def cart
    cart = ::Cart.with(:user_id, id)
    cart ||= ::Cart.create(user_id: id)
  end
end