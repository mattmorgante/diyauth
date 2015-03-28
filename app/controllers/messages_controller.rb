class MessagesController < ApplicationController
  # only signed in users can create a new post 
  before_action :signed_in_user, only: [:new, :create]

  def signed_in_user
    unless 
  end
end
