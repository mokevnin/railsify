class NewPasswordPage < ApplicationPage
  set_url url_helpers.new_password_path

  element :email, "#password_confirmation_type_email"

  element :submit, "input[name=commit]"

  def send_form(mail)
    email.set mail

    submit.click
  end
end
