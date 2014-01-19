class Passwords::EditPage < ApplicationPage
  #TODO переделать на автоматическую подстановку query
  set_url "#{url_helpers.edit_password_path}{?query*}"

  element :password, "#user_password"
  element :password_confirmation, "#user_password_confirmation"

  element :submit, "input[name=commit]"

  def update(attrs)
    password.set attrs[:password]
    password_confirmation.set attrs[:password_confirmation]
    submit.click
  end
end
