require 'test_helper'

class Web::UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
  end

  test "#show" do
    Users::ShowPage.visit id: @user.id
    assert_response :ok
  end

  test "#show with auth" do
    ::Sessions::NewPage.sign_in(@user)
    Users::ShowPage.visit id: @user.id
    assert_response :ok
  end

  test "#new #create #confirm" do
    p = Users::NewPage.visit
    attrs = attributes_for :user
    p.register(attrs)

    user = User.find_by email: attrs[:email]

    get confirm_user_path(user, confirmation_token: user.confirmation_token)

    user.reload

    assert { user.active? }
  end
end
