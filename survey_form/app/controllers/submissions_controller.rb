class SubmissionsController < ApplicationController
  def index
  	render 'index'
  end	

  def counter
  	@counter = session[:counter] ||=0
  end	

  def create
  	@user = SubmissionPage.create(name:params[:name],location:params[:location],language:params[:language],comment:params[:comment])
  	redirect_to "/results/" + @user.id.to_s
  end	

  def display
  	@user = SubmissionPage.find(params[:id])
  	render 'user_info'
  end


end
