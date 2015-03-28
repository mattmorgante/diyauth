class MessagesController < ApplicationController
  # only signed in users can create a new message 
  before_action :signed_in_user, only: [:new, :create]

  def signed_in_user
    unless signed_in? 
      redirect_to signin_url
    end 
  end

  def new 
    @message = Message.new
  end 

  def create
    @message = message.new(message_params)
    @message.user_id = current_user.id
    @message.save
    redirect_to root_path
  end

  def index 
    @messages = Message.all 
  end 
end
