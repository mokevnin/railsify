require 'test_helper'

class ResetPasswordTest < ActionDispatch::IntegrationTest
  test "should reset password" do
    user = create(:user)
    attrs = {email: user.email}

    post password_path(password_confirmation_type: attrs)
    assert_response :redirect

    user.reload

    get edit_password_path(reset_password_token: user.reset_password_token)
    assert_response :success

    old_password = user.password_digest
    password = generate(:string)
    attrs = {
      reset_password_token: user.reset_password_token,
      user: {
        password: password,
        password_confirmation: password
      }
    }

    patch password_path(attrs)
    assert_response :redirect

    user.reload

    assert_not_equal old_password, user.password_digest
  end
end
