class CartProduct < Ohm::Model
	attribute :item_id
	attribute :item_name
	attribute :item_description
	attribute :item_price, Type::Decimal

	reference :cart, :Cart

	index :item_id
end