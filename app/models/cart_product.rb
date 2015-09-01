class CartProduct < Ohm::Model
  include Ohm::DataTypes
  include Ohm::Scope

  attribute :item_id
  attribute :amount
  attribute :price, Type::Decimal
  attribute :name	

  reference :cart, :Cart

  index :item_id
  unique :item_id  


  def total
    price.to_f * amount.to_f
  end
end