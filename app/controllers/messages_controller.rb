class MessagesController < ApplicationController
  # only signed in users can create a new message 
  before_action :signed_in_user, only: [:new, :create]

  def index 
    @messages = Message.all 
  end 
  
  def new 
    @message = Message.new
  end 

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end 


  def signed_in_user
    unless signed_in? 
      redirect_to signin_url
    end 
  end



end
