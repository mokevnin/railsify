require 'test_helper'

class Web::PasswordsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "#edit #update" do
    p = RemindPasswords::NewPage.visit
    p.create(@user.email)
    @user.reload

    @user.password = generate(:string)
    attrs = {
      password: @user.password,
      password_confirmation: @user.password
    }

    p = Passwords::EditPage.visit query: {reset_password_token: @user.reset_password_token}
    p.update(attrs)

    p = Sessions::NewPage.sign_in(@user)
    assert_response :ok
  end
end
