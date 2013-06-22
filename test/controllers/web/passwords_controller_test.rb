require 'test_helper'

class Web::PasswordsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    attrs = {:email => @user.email}

    post :create, :password_confirmation_type => attrs
    assert_response :redirect

    @user.reload

    assert_not_nil @user.reset_password_token?
    assert @user.reset_password_sent_at?
  end

  test "should get edit and redirect without token" do
    get :edit
    assert_response :redirect
  end

  test "should path update and redirect without token" do
    patch :update
    assert_response :redirect
  end
end
