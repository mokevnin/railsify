class Account::CompanyFieldsSection < ApplicationSection
  element :state_event, "#company_state_event"
  element :name, "#company_name"
  element :login, "#company_login"
  element :logo, "#company_logo"
  element :facebook_group_link, "#company_facebook_group_link"
  element :public_email, "#company_public_email"
  element :phone, "#company_phone"
  element :description, "#company_description"

  element :submit, "input[name=commit]"
end
