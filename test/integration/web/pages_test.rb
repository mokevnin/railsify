require 'test_helper'

class Web::PageTest < ActionDispatch::IntegrationTest
  test "#tour" do
    Pages::TourPage.visit
    assert_response :ok
  end
end
