class SurveysController < ApplicationController
  def index
  	render 'index'
  end

  def create
  	@profile = Survey.create(name:params[:name],location:params[:location],language:params[:language],comment:params[:comment])
  		session[:counter] ||= 0
  		session[:counter] += 1 
  	redirect_to "/results/" + @profile.id.to_s
  end		

  def display
  	@profile = Survey.find(params[:id])
  	@message = "You've submitted this form #{session[:counter]} time(s)."
  	render 'results'
  end

end
