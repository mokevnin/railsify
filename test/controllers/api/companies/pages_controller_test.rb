require 'test_helper'

class Api::Companies::PagesControllerTest < ActionController::TestCase
  setup do
    @company = create :company
    @user = @company.manager_users.last
    sign_in(@user)
  end

  test "#reorder" do
    page = create 'company/page', company: @company, order: 1
    page2 = create 'company/page', company: @company, order: 2

    subdomain @company.login

    post :reorder, pages: [page2.id, page.id]
    assert_response :success

    page.reload
    assert { page.order == 2 }

    page2.reload
    assert { page2.order == 1 }
  end

end
