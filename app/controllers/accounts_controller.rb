class AccountsController < ApplicationController
  before_action :current_user, only: [:new, :create, :index, :edit]
  #before_action :check_user, only: :new
  def index
  	check_user
  	redirect_to home_path
  	@accounts = Account.where(user_id:session[:user_id])
  	#puts session[:user_id]
  	puts "cccccccccccccccccccccccccc"
  end
  def new
  		check_user
  		@account = Account.new
  end

  def create
  			check_user
  			@account = Account.new(check_params)
  			if @account.save
  				redirect_to home_path
  			else
  				redirect_to home_path
  			end
  end
  
  def destroy
  		#@account = Account.find(params[:id])
  		Account.find(params[:id]).destroy 
  		redirect_to home_path
  		#redirect_to
  end 
  
  private 
  def check_params
  		params[:account][:user_id] = session[:user_id]
  		if params[:account][:money_type].blank?
  			params[:account][:money_type]= 'USD'
  		end
  		if params[:account][:balance].blank?
  			params[:account][:balance]= 0.0
  		end

  		params.require(:account).permit(:name, :money_type, :balance, :user_id)
  end

end
