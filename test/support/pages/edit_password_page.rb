class EditPasswordPage < ApplicationPage
  #TODO переделать на автоматическую подстановку query
  set_url "#{url_helpers.edit_password_path}{?query*}"

  element :password, "#user_password"
  element :password_confirmation, "#user_password_confirmation"

  element :submit, "input[name=commit]"

  def reset_password(attrs)
    password.set attrs[:password]
    password_confirmation.set attrs[:password]

    submit.click
  end
end
