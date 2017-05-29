class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end

  def new
  end

  def create
  	@new_dojo = Dojo.create(branch:params[:branch],street:params[:street],city:params[:city],state:params[:state])
  	@new_dojo.save
  	redirect_to '/'
  end

  def show
  	@dojo = Dojo.find(params[:id])		
  end	

  def edit
  	@dojo = Dojo.find(params[:id])
  end

  def update
  	dojo = Dojo.find(params[:id])
  	dojo.branch = params[:branch]
  	dojo.street = params[:street]
  	dojo.city = params[:city]
  	dojo.state = params[:state]
  	dojo.save
  	redirect_to '/'
  end	
end
