class CartProduct < Ohm::Model
  include Ohm::DataTypes
  include Ohm::Scope

  attribute :item_id
  attribute :measure_item_id
  attribute :amount_with_measure_name_and_price
  attribute :amount
  attribute :price, Type::Decimal
  attribute :name
  attribute :created_at, Type::Time	

  reference :cart, :Cart

  index :item_id_measure_item_id_shopping_cart_id
  unique :item_id_measure_item_id_shopping_cart_id  


  def item_id_measure_item_id_shopping_cart_id
    "#{item_id}_#{measure_item_id}_#{shopping_cart.id}"
  end

  def total
    price.to_f * amount.to_f
  end
end