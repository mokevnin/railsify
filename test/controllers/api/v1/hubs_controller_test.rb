require 'test_helper'

class Api::V1::HubsControllerTest < ActionController::TestCase
  setup do
    @hub = create :hub
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end
end
