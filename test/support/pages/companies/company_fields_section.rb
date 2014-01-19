class Companies::CompanyFieldsSection < ApplicationSection
  element :state_event, "#company_state_event"
  element :name
  element :login
  element :facebook_group_link
  element :public_email
  element :phone
  element :description, as: :text

  element :submit, "input[name=commit]"
end
