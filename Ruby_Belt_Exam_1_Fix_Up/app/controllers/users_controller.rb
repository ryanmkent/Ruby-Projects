class UsersController < ApplicationController
  def login  
  end
  
  def create
    user = User.new(user_params)
    user.save
    unless user.errors.any? == true
      session[:user_id] = user.id
      redirect_to "/songs"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/"
     end 
  end

  def authenticate
      user = User.find_by({email:params[:email]})
      puts '**********************************************'
      puts user
      puts '**********************************************'
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/songs'
      else 
        flash[:errors] = "Incorrect username and/or password"
        redirect_to '/'
        puts 'Incorrect username and/or password!'
      end
  end

  def show
    @user = User.find(params[:user_id])
    @playlist = Playlist.find_by_user_id(params[:id])
    @song = Song.find_by_id(params[:id])   
    if !@playlist
      @playlist = Playlist.new(song_id: params[:id], user_id: session[:user])
      @playlist.save
    end  
    @ps = @playlist.songs
  end

  def logout
    session.clear
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation) 
  end 
end
