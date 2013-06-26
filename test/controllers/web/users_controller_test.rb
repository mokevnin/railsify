require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @params = {id: @user.login}
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

    post :create, user: attrs
    assert_response :redirect

    user = User.where(attrs.extract(:email)).first
    assert user
    assert_not_nil @user.reset_password_token?
    assert user.waiting_confirmation?
    assert user.confirmation_sent_at?
  end
end
