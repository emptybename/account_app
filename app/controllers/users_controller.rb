class UsersController < ApplicationController
  before_action :current_user, only: [:show, :new]
  def new
  		check_session
  		@user = User.new 		
  end

  def create
  		@user = User.new(check_params)
  		if @user.save
  				redirect_to home_path
  		else 
  			render 'new'
  		end 
  end

  	def show 
  		#check_session
  		#current_user
  		check_user
  	end

  private

  	def check_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  		
  	end
end
