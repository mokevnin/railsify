require 'test_helper'

class Web::Users::TopicsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @topic = create :topic, creator: @user
    @params = {user_id: @user.login}
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end

end
