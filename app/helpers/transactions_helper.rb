module TransactionsHelper
		def check_balance(_id, amount)
			Account.where(id:_id).first.balance>=amount
		end
		def remove_balance(_id, amount)
				a= Account.where(id:_id).first
				a.update_attributes(balance: a.balance - amount)
		end
		def add_balance(_id,amount)
				a = Account.where(id:_id).first
				a.update_attributes(balance: a.balance + amount)
		end
		def transfer_balance(_id,_id1,amount)
			remove_balance(_id, amount)
			add_balance(_id1,amount)
		end


end
