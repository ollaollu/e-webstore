class ChangeColumnNameInOrderProducts < ActiveRecord::Migration
  def change
    rename_column :order_products, :item_id, :user_id
  end  	
end
