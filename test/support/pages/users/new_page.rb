module Users
  class NewPage < ApplicationPage
    set_url url_helpers.new_user_path

    element :email, "#user_email"
    element :first_name, "#user_first_name"
    element :last_name, "#user_last_name"
    element :password, "#user_password"
    element :accept_agreement, "#user_accept_agreement"

    element :submit, "input[name=commit]"

    def register(attrs)
      [:email, :first_name, :last_name, :password].each do |name|
        send(name).set attrs[name]
      end
      accept_agreement.click

      submit.click
    end
  end
end
