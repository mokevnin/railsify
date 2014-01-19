require 'test_helper'

class Web::Companies::SchedulesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company
    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#show" do
    ::Companies::Schedules::ShowPage.visit
    assert_response :ok
  end
end

