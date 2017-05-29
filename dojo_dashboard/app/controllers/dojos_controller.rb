class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  	render 'index'
  end

  def new
  	render 'new_dojo'
  end	

  def create 
  	Dojo.create(branch:params[:branch],city:params[:city],street:params[:street],state:params[:state])
  	redirect_to '/'
  end

  def edit
  	@dojo = Dojo.find(params[:id])
  	render "edit"
  end

  def update
  	dojo = Dojo.find(params[:id])
  	dojo.branch = params[:branch]
  	dojo.city = params[:city]
  	dojo.street = params[:street]
  	dojo.state = params[:state]
  	dojo.save
  	redirect_to '/'
  end

  def destroy
  	dojo = Dojo.find(params[:id])
  	dojo.destroy
  	redirect_to '/'
  end	

  def show
  	@dojo = Dojo.find(params[:dojoid])
    @students = Student.all
    # @student = Student.find(params[:studentid])
    render 'show'
  end
end
