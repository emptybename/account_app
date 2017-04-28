class Transaction < ActiveRecord::Base
	belongs_to :from_account, class_name: "Account",
								foreign_key: "from_account_id"
	belongs_to :to_account, class_name: "Account",
								foreign_key: "to_account_id"
	validates :transaction_type, presence:true
	validates :amount, presence:true, if: :value_is_correct?
	#validates :date_of_transaction, presence:true
	validates :from_account_id, presence:true 

	def value_is_correct?
		amount>0
	end

end
