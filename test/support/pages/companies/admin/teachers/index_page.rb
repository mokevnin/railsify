class Companies::Admin::Teachers::IndexPage < ApplicationPage
  set_url url_helpers.company_admin_teachers_path

  sections :teachers, ::Companies::Admin::TeacherRowSection, "table#teachers tr.teacher"
end
