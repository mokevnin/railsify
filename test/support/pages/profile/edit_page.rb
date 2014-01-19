module Profile
  class EditPage < ApplicationPage
    set_url url_helpers.edit_account_profile_path

    element :first_name, "#user_first_name"
    element :last_name, "#user_last_name"
    element :avatar, "#user_avatar"
    element :description, "#user_description"

    element :submit, "input[name=commit]"

    def update(attrs)
      [:first_name, :last_name, :avatar, :description].each do |name|
        send(name).set attrs[name]
      end

      submit.click
    end
  end
end
