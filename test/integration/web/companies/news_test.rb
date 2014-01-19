require 'test_helper'

class Web::Companies::NewsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @news = @company.news.last

    subdomain @company.login
  end

  test "#index" do
    ::Companies::News::IndexPage.visit
    assert_response :ok
  end

  test "#show" do
    ::Companies::News::ShowPage.visit id: @news.slug
    assert_response :ok
  end
end
