class UsersController < ApplicationController
  def index
  	render json: User.all
  end

  def new
  	@user = User.includes(:name,:id)
  end

  def create
  	@user = User.new(name:params[:name])
  	@user.save
  	redirect_to '/users'
  end

  def individual
  	@user = User.find(params[:id])
  end 

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.name = params[:new_name]
  	@user.save
  	redirect_to '/users'
  end

  def total
  	@users = User.all
  	@users.count
  end	

end
