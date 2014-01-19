require 'test_helper'

class Web::WelcomeTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "#index" do
    Welcome::IndexPage.visit
    assert_response :ok
  end
end
