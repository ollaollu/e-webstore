class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.integer :telephone
      t.string :payment_gateway
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :orders, :user_id
  end
end
