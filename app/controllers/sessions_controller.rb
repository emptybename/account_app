class SessionsController < ApplicationController
  before_action :current_user, only: :new
  def new
  		check_session
  end
  
  def create
  		user = User.find_by(email: params[:session][:email])
  		if user && user.authenticate(params[:session][:password])
  			log_in user
  			redirect_to home_path
  		else
  			render 'new'
  		end
  end
  def destroy
  		log_out
  		redirect_to root_path
  end
end
