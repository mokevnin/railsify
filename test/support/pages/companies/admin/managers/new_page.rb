class Companies::Admin::Managers::NewPage < ApplicationPage
  set_url url_helpers.new_company_admin_manager_path

  element :users_list, "#company_manager_user_id_chosen"
  elements :users, ".active-result"
  element :submit, "input[name=commit]"

  def create(user)
    users_list.click
    users.detect{|e| e.text == user.to_s}.click
    submit.click
  end
end
