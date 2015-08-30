class ChangeDatatypeForUserId < ActiveRecord::Migration
  def change
    change_table :payment_transactions do |t|
    	t.change :user_id, :integer
  	end
  end
end
