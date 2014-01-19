require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase

  setup do
    @user = create :user
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#login" do
    attrs = { email: @user.email, password: @user.password }

    post :create, user_sign_in_type: attrs
    assert_response :redirect

    assert { signed_in? }
  end

  test "#logout" do
    sign_in @user

    delete :destroy
    assert_response :redirect

    assert { !signed_in? }
  end
end
