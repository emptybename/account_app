class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :money_type, null:false, default: "USD"
      t.float :balance, null:false, default:0.0

      t.timestamps null: false
    end
  end
end
