require 'test_helper'

class Web::TopicsControllerTest < ActionController::TestCase
  setup do
    @topics = create_list :topic, 5
    @user = create :user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should post create" do
    sign_in @user

    attrs = attributes_for 'topic'

    post :create, topic: attrs
    assert_response :redirect

    topic = Topic.where(attrs.slice(:body))
    assert topic
  end

end
