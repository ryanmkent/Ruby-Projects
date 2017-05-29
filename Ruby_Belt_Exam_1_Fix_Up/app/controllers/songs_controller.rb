class SongsController < ApplicationController
  def index
  	@user = User.find_by_id(session[:user_id])
    if !@user
      redirect_to "/"
    end
    @songs = Song.all
  end

  def create
  	@song = Song.new(song_params)
    @song.save
    unless @song.errors.any? == true
      #session[:user_id] = user.id
      redirect_to "/songs"
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to "/songs"
    end
  end

  def add
  	user = User.find(params[:id])
  	@playlist = Playlist.find_by_id(user.id)
  	
  	@song = Song.find(params[:id])
  	@song.play_counter ||=0
  	@song.play_counter = @song.play_counter + 1
  	@song.save
  	redirect_to "/songs"
  end	

  def show
  	@song = Song.find(params[:id])
  end	

  private
	  def song_params
	  	params.require(:song).permit(:title, :artist, :play_counter)
	  end

	  def playlist_params
	  	params.require(:playlist).permit(:user_id, :song_id)
	  end	
end
