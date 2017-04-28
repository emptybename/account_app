class AddUniqueConstriantsToAccounts < ActiveRecord::Migration
  def change
  	add_index :accounts, [:name, :user_id], unique:true 
  end
end
