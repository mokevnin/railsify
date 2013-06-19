require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    @user = create :topic
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
