class NewUserPage < ApplicationPage
  set_url url_helpers.new_user_path

  element :email, "#user_email"
  element :login, "#user_login"
  element :password, "#user_password"
  element :password_confirmation, "#user_password_confirmation"

  element :submit, "input[name=commit]"

  def register(attrs)
    [:email, :login, :password, :password_confirmation].each do |name|
      send(name).set attrs[name]
    end

    submit.click
  end
end
