class MessagesController < ApplicationController

  def index
    @messages = Message.all
    people_ids = (@messages.pluck(:from_id) | @messages.pluck(:to_id)).delete_if { |i| i == current_user.id}
    @people = User.where(id: people_ids)
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end
  
  def create
    @message = current_user.sent_messages.new(message_params)
    @message.save
    respond_with(@message)
  end

  private

  def message_params
    params.require(:message).permit(:to_id, :content)
  end
end
