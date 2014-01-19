require 'test_helper'

class Web::Companies::PagesControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user

    @company = create :company, creator: user
    subdomain(@company.login)

    @page = create 'company/page', company: @company
  end

  test "should get show" do
    get :show, id: @page.slug
    assert_response :success
  end
end
