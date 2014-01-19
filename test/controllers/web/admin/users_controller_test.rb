require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user
    @attrs = attributes_for :user
    @user = create :user
  end

  test "index" do
    get :index
    assert_response :success
  end

  test "edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "update" do
    attrs = attributes_for(:user).extract!(:email, :first_name, :last_name)

    patch :update, id: @user.id, user: attrs
    assert_response :redirect

    @user.reload

    assert { attrs[:email] == @user.email }
  end

  test "destroy" do
    delete :destroy, id: @user
    assert_response :redirect

    assert { !User.exists?(@user) }
  end


end
