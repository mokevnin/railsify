class NewSessionPage < ApplicationPage
  set_url url_helpers.new_session_path

  element :email, "#user_sign_in_type_email"
  element :password, "#user_sign_in_type_password"

  element :submit, "input[name=commit]"

  def self.sign_in(user)
    p = visit
    p.email.set user.email
    p.password.set user.password

    p.submit.click
    p
  end
end
