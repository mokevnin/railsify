class Api::V1::Topics::CommentsController < Api::V1::Topics::ApplicationController
  def create
    comment = TopicCommentType.new(params[:topic_comment])
    comment.creator = current_user
    comment.topic = resource_topic
    comment.save

    respond_with(comment, location: nil)
  end
end
