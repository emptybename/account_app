class Account < ActiveRecord::Base
	belongs_to :user
	has_many :from_transaction, class_name: "Transaction",
								foreign_key: "from_account_id",
								dependent: :destroy
	has_many :to_transaction, class_name: "Transaction",
								foreign_key: "to_account_id",
								dependent: :destroy
	validates :name, presence:true, uniqueness: { scope: :user_id, 
									message: " only one account of this name " }
end
