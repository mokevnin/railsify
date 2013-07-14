require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test "#confirm" do
    p = NewUserPage.visit
    attrs = attributes_for :user
    p.register(attrs)

    user = User.where(attrs.extract(:login)).first

    get confirm_user_path(user, confirmation_token: user.confirmation_token)

    user.reload

    assert { user.active? }
  end
end
