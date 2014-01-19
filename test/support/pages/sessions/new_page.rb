class Sessions::NewPage < ApplicationPage
  set_url url_helpers.new_session_path

  element :email, "#user_sign_in_type_email"
  element :password, "#user_sign_in_type_password"
  element :submit, "input[name=commit]"

  def self.sign_in(user)
    p = visit
    p.sign_in(user)
    p
  end

  def sign_in(user)
    email.set user.email
    password.set user.password

    submit.click
  end
end
