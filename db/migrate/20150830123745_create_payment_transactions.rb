class CreatePaymentTransactions < ActiveRecord::Migration
  def change
    create_table :payment_transactions do |t|
      t.string :user_id
      t.decimal :amount
      t.string :status
      t.string :payment_gateway
      t.string :transaction_outcome

      t.timestamps null: false
    end
    add_index :payment_transactions, :user_id
  end
end
