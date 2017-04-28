class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type, null:false
      t.string :tag_type
      t.float :amount, null:false
      t.date :date_of_transaction, null:false
      t.text :description
      t.integer :from_account_id, null:false
      t.integer :to_account_id
      t.timestamps null: false
    end
  end
end
