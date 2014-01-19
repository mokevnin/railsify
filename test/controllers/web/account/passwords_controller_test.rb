require 'test_helper'

class Web::Account::PasswordsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in(@user)
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should update password" do
    old_password = @user.password_digest
    new_password = "new_password"
    attrs = { password: new_password, password_confirmation: new_password }

    put :update, auth_token: @user.reset_password_token, user: attrs
    assert_response :redirect

    @user.reload
    assert {@user.password_digest != old_password}
  end

end
