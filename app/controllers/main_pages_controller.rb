class MainPagesController < ApplicationController
  before_action :user_accounts
  before_action :current_user
  def new
  	@transaction = Transaction.new
  	@account = Account.new
  	@accounts = Account.where(user_id:session[:user_id])
  	@transactions = Transaction.where(user_id:session[:user_id])
  end

end
