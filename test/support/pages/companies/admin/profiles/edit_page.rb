class Companies::Admin::Profiles::EditPage < ApplicationPage
  set_url url_helpers.edit_company_admin_profile_path

  section :company_fields, Companies::Admin::CompanyFieldsSection, "form.simple_form"

  def update(attrs)
    company_fields.find("option[value='#{attrs[:state_event]}']").select_option
    company_fields.submit.click
  end
end
