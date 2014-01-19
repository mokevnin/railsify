class RemindPasswords::NewPage < ApplicationPage
  set_url url_helpers.new_remind_password_path

  element :email, "#user_password_remind_type_email"
  element :submit, "input[name=commit]"

  def create(password)
    email.set password
    submit.click
  end
end
