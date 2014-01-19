require 'test_helper'

class Web::Companies::Admin::ManagersControllerTest < ActionController::TestCase
  setup do
    @company = create :company
    @manager = @company.managers.last
    @user = @manager.user

    sign_in @user
    subdomain @company.login
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "create" do
    user = create :user
    attrs = {user_id: user.id}

    post :create, company_manager: attrs
    assert_response :redirect

    user.reload
    assert { @company.manager_users.include?(user) }
  end

  test "destroy" do
    delete :destroy, id: @manager.id
    assert_response :redirect

    assert { !@company.managers.include?(@manager) }
  end

end
