class Companies::Admin::Managers::IndexPage < ApplicationPage
  set_url url_helpers.company_admin_managers_path

  sections :managers, ::Companies::Admin::ManagerRowSection, "table#managers tr.manager"

  def destroy(manager)
    manager_section = managers.detect {|s| manager.full_name == s.full_name}
    manager_section.destroy_link.click
  end
end
