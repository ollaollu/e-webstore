class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :item_id
      t.integer :amount
      t.decimal :price
      t.string :name

      t.timestamps null: false
    end
    add_index :order_products, :product_id
    add_index :order_products, :item_id
  end
end
