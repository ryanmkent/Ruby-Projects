class UsersController < ApplicationController
  def login
  end
  
  def create
  	user = User.new(user_params)
  	user.save
  	unless user.errors.any? == true
  		session[:user_id] = user.id
  		redirect_to '/events'
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to '/'
  	end		
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
   	@user = User.find(params[:id])
  	@user.first_name = params[:user]['first_name']
  	@user.last_name = params[:user]['last_name']
  	@user.email = params[:user]['email']
  	@user.location = params[:user]['location']
  	@user.state = params[:user]['state']
  	@user.save
  	redirect_to '/events'
  	flash[:notice] = 'User Information Successfully Updated!'
  end

  def delete
  end

  def authenticate
  		user = User.find_by({email:params[:email]})
  		puts '**********************************************'
  		puts user
  		puts '**********************************************'
  		if user && user.authenticate(params[:password])
  			session[:user_id] = user.id
  			redirect_to '/events'
  		else 
  			flash[:errors] = "Incorrect username and/or password"
  			redirect_to '/'
  			puts 'Incorrect username and/or password!'
  		end
  end

  def logout
  	session.clear
  	redirect_to '/'
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation) 
  end	
end