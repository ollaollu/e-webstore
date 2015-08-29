class Cart < Ohm::Model
	attribute :user_id 

	collection :cart_products, :CartProduct

	index :user_id
	unique :user_id
end