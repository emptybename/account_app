class AddUserReferenceToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :user, index: true, foreign_key: true,  null:false
  end
end
