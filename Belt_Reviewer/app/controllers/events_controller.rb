class EventsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    if !@user
      redirect_to "/"
    end
    puts '********************************************'
    @events = Event.all.order('date DESC')
    
  end

  def new
  end

  def create
    event = Event.new(event_params)
    event.user = User.find(session[:user_id])  # Instead of using user_id from form, use user_id stored in session.  Use `find` not `find_by_id`
    event.save
    unless event.errors.any? == true
      #session[:user_id] = user.id
      redirect_to "/events"
    else
      flash[:errors] = event.errors.full_messages
      redirect_to "/events"
     end 
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.name = params[:event]['name']
    @event.date = params[:event]['date']
    @event.location = params[:event]['location']
    @event.state = params[:event]['state']
    @event.save
    redirect_to '/events'
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to '/events'
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.where(event_id: params[:id]) 
    @attendee = Attendee.where(event_id: params[:id])
  end

  def create_comments
    @comment = Comment.new(comment_params)
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    @comment.user = user
    @comment.event = event
    @comment.save
    redirect_to "/events/#{@comment.event_id}/show"
  end

  def join_event
    puts params[:id]
    user = User.find(session[:user_id])
    event = Event.find(params[:event_id])
    @attendee = Attendee.new(user: user,event: event)
    @attendee.save
    redirect_to "/events" # IF YOU EVER FAIL TO SEND INFO, MAKE SURE THE PATH IS IN DOUBLE QUOTATION MARKS!!
  end  

  def cancel_attendance
    puts params[:id]
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    @attendee = Attendee.find_by(user: user, event: event) #we put '.first' because we only want one user from the returned array
    @attendee.destroy
    redirect_to "/events"
  end 

  private
    def event_params
      params.require(:event).permit(:name, :date, :location, :state, :user_id, :first_name) 
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :event_id)
    end

end