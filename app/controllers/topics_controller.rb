class TopicsController < ApplicationController
    before_action :authenticate_user!

    def show
        @topic = Topic.eager_load(:messages, :subscribers, :admins).find(params[:id])
    end
  
    def new
      @topic = Topic.new
    end

    def create
      @topic = Topic.new(topic_params)
  
      if @topic.save
        redirect_to @topic, notice: 'Topic was successfully created.'
      else
        render :new
      end
    end
  
    private

    def topic_params
      params.require(:topic).permit(:title, :description, :user_id)
    end
  end
  