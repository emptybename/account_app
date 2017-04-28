class TransactionsController < ApplicationController
  before_action :current_user
  before_action :user_accounts
  
  def index
  		check_user
  		redirect_to home_path
  		#puts "indexxxxxxxxxxxxxxxxxxx"
  		@transactions = Transaction.where(user_id:session[:user_id])
  end

  def new
  		check_user
  		accounts
  		transactions
  		#@transactions = Transaction.where(user_id:session[:user_id])
  		#redirect_to url_for(:controller => :accounts, :action => :index)
  		@transaction = Transaction.new

  end
  
  def create
  			#current_user	
  			check_user
  			 @f=true
  			@transaction = Transaction.new(check_params)

  			if @f
  				puts "hello============================="
  				if @transaction.save
					if params[:transaction][:transaction_type] == "delete"
							remove_balance(params[:transaction][:from_account_id].to_i, 
									params[:transaction][:amount].to_f)
					elsif params[:transaction][:transaction_type] == "transfer"
							transfer_balance(params[:transaction][:from_account_id].to_i,
									params[:transaction][:to_account_id].to_i,
										 params[:transaction][:amount].to_f)
					else
							add_balance(params[:transaction][:from_account_id].to_i,
								    params[:transaction][:amount].to_f)
					end
  					puts "lol==========================="
  					redirect_to home_path
  				else
  					redirect_to home_path
  				end
  			else
  				puts "abc=============================="
  				redirect_to home_path
  			end
  end
  def edit
  			check_user
  			@transaction = find_transaction
		
 end
  def update
  		check_user
  		@transaction = find_transaction
  		@f = true
  		check_params
  		if @f
  			if @transaction[:transaction_type] == "delete"
  					add_balance(@transaction[:from_account_id],
								    @transaction[:amount])
  			elsif @transaction[:transaction_type] == "insert"
  				remove_balance(@transaction[:from_account_id],
								    @transaction[:amount])
  			else
  				transfer_balance(@transaction[:to_account_id],
  							@transaction[:from_account_id],
								@transaction[:amount])
  			end

  			puts @transaction[:from_account_id]
  			puts @transaction[:to_account_id]
  			puts @transaction[:transaction_type]
  			puts "######################################"
  			#debugger
  			if @transaction.update_attributes(check_params)
  				

  			     puts "#######################################"
  			     puts params[:transaction][:from_account_id].to_i
  			     puts params[:transaction][:to_account_id].to_i

  				if params[:transaction][:transaction_type] == "delete"
							remove_balance(params[:transaction][:from_account_id].to_i, 
									params[:transaction][:amount].to_f)
				elsif params[:transaction][:transaction_type] == "transfer"
							transfer_balance(params[:transaction][:from_account_id].to_i,
									params[:transaction][:to_account_id].to_i,
										 params[:transaction][:amount].to_f)
				else
							add_balance(params[:transaction][:from_account_id].to_i,
								    params[:transaction][:amount].to_f)
				end
			else
				render 'edit'
				#return render 'edit' 
				#redirect_to edit_transaction_path()
  			end
  		else 
  			#redirect_to edit_transaction_path(params[:id])
  				render 'edit'	
  		end


  end
  def destroy

  		transaction = find_transaction
  		if transaction[:transaction_type] == "delete"
  			add_balance(transaction[:from_account_id],
								    transaction[:amount])
  		elsif transaction[:transaction_type] == "insert"
  			remove_balance(transaction[:from_account_id],
								    transaction[:amount])
  		else
  			transfer_balance(transaction[:to_account_id],
  							transaction[:from_account_id],
								transaction[:amount])
  		end
  		 transaction.destroy #Transaction.find(params[:id]).destroy
  		redirect_to home_path
  end
  
=begin  def destroy
  		Transaction.destroy.where(id:params[:id])
  		#redirect_to
  end
=end
  private
  def find_transaction
  		Transaction.find(params[:id])
  end
  def check_params
  	#binding.pry
  		params[:transaction][:user_id] = session[:user_id]	
  		puts params[:transaction]
  		puts "bye==================="

	@f=false if params[:transaction][:transaction_type].blank? || params[:transaction][:from_account_id].blank? ||
	     params[:transaction][:from_account_id].to_s == params[:transaction][:to_account_id].to_s||
	      params[:transaction][:amount].to_f <= 0
	      if @f
	      	puts "nice==================="
	      end
	if @f && params[:transaction][:transaction_type] == "transfer" 
			@f = false if params[:transaction][:to_account_id].blank?
	end
	if params[:transaction][:transaction_type] == "delete" || 
						params[:transaction][:transaction_type] == "transfer" && @f
		@f=false	unless check_balance(params[:transaction][:from_account_id].to_i, 
			                                 params[:transaction][:amount].to_f)
		
  	end
  		if params[:transaction][:date_of_transaction].blank?
  				params[:transaction][:date_of_transaction] = DateTime.now
  		end
  		params.require(:transaction).permit(:transaction_type, :amount, :tag_type, :description,
  		 :date_of_transaction, :from_account_id, :to_account_id, :user_id)
  end
  		
end
