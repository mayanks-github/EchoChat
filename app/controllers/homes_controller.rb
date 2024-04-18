class HomesController < ApplicationController
  def index
    @topics = Topic.all
  end
end
