require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    @topic = create :topic
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
