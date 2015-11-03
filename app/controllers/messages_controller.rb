class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
  end

  def create
    new_message_params = message_params
    new_message_params[:from] = '+15033087505'
    @message = Message.create(new_message_params)
    redirect_to root_path
  end

private

  def message_params
    params.require("message").permit(:to, :body)
  end
end
