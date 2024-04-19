class MessagesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @topic = Topic.find(params[:topic_id])
      @message = @topic.messages.new(message_params)
      @message.creator = current_user
  
      if @message.save
        redirect_to topic_path(@topic), notice: 'Message created successfully.'
      else
        redirect_to topic_path(@topic), alert: 'Failed to create message.'
      end
    end
  
    def destroy
      @message = Message.find(params[:id])
      @message.destroy
  
      redirect_to topic_path(@message.topic), notice: 'Message deleted successfully.'
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content, :user_id)
    end
  end
  