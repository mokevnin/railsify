require 'test_helper'

class Api::V1::Topics::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create 'topic/comment'
    @topic = @comment.topic
    @user = @topic.creator
    @params = {topic_id: @topic.id, format: :json}

    sign_in @user
  end

  test "#index" do
    get :index, @params
    assert_response :success
  end

  test "#create" do
    attrs = attributes_for 'topic/comment'

    post :create, @params.merge(topic_comment: attrs, format: :json)
    assert_response :created

    comment = @topic.comments.where(attrs.extract(:body))
    assert { comment }
  end
end
