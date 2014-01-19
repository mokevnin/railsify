class Account::Companies::NewPage < ApplicationPage
  set_url url_helpers.new_account_company_path

  section :company_fields, ::Account::CompanyFieldsSection, "form.simple_form"

  def create(attrs)
    f = company_fields

    f.state_event.select Company.human_state_event_name(attrs[:state_event])
    f.name.set attrs[:name]
    f.login.set attrs[:login]
    f.logo.set attrs[:logo]
    f.facebook_group_link.set attrs[:facebook_group_link]
    f.public_email.set attrs[:public_email]
    f.phone.set attrs[:phone]
    f.description.set attrs[:description]

    f.submit.click
  end
end
