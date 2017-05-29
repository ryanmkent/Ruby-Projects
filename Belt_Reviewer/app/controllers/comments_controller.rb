class CommentsController < ApplicationController
  def comments_index
  	@comments = Comment.all
  	@event = Event.find(params[:event_id])
  	render '/events/#{@event.id}/show'
  end

  def create_comments
  	@comment = Comment.new(comment_params)
  	@user = User.find(session[:user_id])
  	@event = Event.find(params[:event_id])
  	@comment.save
  	redirect '/events/<%= @comment.event_id %>/show'
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :event_id)
  end
end
