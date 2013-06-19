class Api::V1::Topics::ApplicationController < Api::ApplicationController
  def resource_topic
    Topic.find(params[:topic_id])
  end
end
