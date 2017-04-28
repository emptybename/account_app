class AddUserReferenceToTransactions < ActiveRecord::Migration
  def change
    add_reference :transactions, :user, index: true, foreign_key: true, null:false, dependent: :destroy
  end
end
