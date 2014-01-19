require 'test_helper'

class Web::CompaniesTest < ActionDispatch::IntegrationTest
  test "#index" do
    ::Companies::IndexPage.visit
    assert_response :ok
  end
end
