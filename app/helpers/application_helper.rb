module ApplicationHelper

		def fulltitle(base_title = "")
			end_title = "Account App"
			if base_title.empty?
				end_title
			else
				base_title
			end
		end

		def current_user
			if session[:user_id]
				@current_user = User.find(session[:user_id])
			end
		end

		def check_session
				#current_user
				if @current_user
					redirect_to home_path
				end
		end

		def check_user
			unless @current_user
  				redirect_to root_path
  			end
		end

		def user_accounts
			@account_map = Account.where(user_id:session[:user_id]).map{|account| [account.name,account.id]}
      #binding.pry
		end

		def accounts
  				check_user
  				@acc = Account.where(user_id:session[:user_id])
  				#puts session[:user_id]
  				puts "cccccccccccccccccccccccccc"
  		end

  		def transactions
  			check_user
  			@transactions = Transaction.where(user_id:session[:user_id])	
  		end
end
