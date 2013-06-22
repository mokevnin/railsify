require 'test_helper'

class EmailConfirmationTest < ActionDispatch::IntegrationTest
  test "should confirm email" do
    attrs = attributes_for :user

    post users_path, user: attrs
    assert_response :redirect

    user = User.where(attrs.extract(:login)).first

    get confirm_user_path(user, confirmation_token: user.confirmation_token)
    assert_response :redirect

    user.reload

    assert user.active?
  end
end
