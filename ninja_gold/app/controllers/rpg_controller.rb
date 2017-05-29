class RpgController < ApplicationController
  def index
  	session[:counter] ||=0
  	@gold_total = "Your Gold: #{session[:counter]}"
  	render 'index'
  end	

  def farm
  	session[:counter] += rand(10..20)
  	redirect_to '/'
  end

  def cave
  	session[:counter] += rand(5..10)
  	redirect_to '/'
  end

  def house
  	session[:counter] += rand(2..5)
  	redirect_to '/'
  end

  def casino
  	session[:counter] += rand(-50..50)
  	redirect_to '/'
  end
end
