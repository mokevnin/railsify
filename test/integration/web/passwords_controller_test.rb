require 'test_helper'

class ResetPasswordTest < ActionDispatch::IntegrationTest
  test "#update" do
    user = create(:user)

    p = NewPasswordPage.visit
    p.send_form(user.email)

    user.reload

    p = EditPasswordPage.visit(query: {reset_password_token: user.reset_password_token})
    password = generate(:string)
    attrs = {
      password: password,
      password_confirmation: password
    }
    p.reset_password(attrs)

    user.password = password

    NewSessionPage.sign_in(user)
    #TODO подумать над проверкой элементов
    assert { page.has_content?('Sign Out') }
  end
end
