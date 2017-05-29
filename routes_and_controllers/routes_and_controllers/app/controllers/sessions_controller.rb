class SessionsController < ApplicationController
  
  def create
  	session[:count] ||=0
  	render text: "You have visited this url #{session[:count]+=1} times" 
  end

  def reset
  	reset_session
  	render text: "Destroyed the session!"
  end

end

