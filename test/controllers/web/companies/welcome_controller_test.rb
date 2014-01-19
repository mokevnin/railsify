require 'test_helper'

class Web::Companies::WelcomeControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user

    @company = create :company, creator: user
    subdomain @company.login
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
