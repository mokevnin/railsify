require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @params = {id: @user.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for :user

    post :create, @params.merge(user: attrs)
    assert_response :redirect

    user = User.find_by_login(attrs[:login])
    assert user
  end
end
