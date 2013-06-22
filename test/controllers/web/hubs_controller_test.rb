require 'test_helper'

class Web::HubsControllerTest < ActionController::TestCase
  setup do
    @hub = create_list 'category/hub', 5
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
