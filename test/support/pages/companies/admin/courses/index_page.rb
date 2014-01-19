class Companies::Admin::Courses::IndexPage < ApplicationPage
  set_url url_helpers.company_admin_courses_path

  sections :courses, ::Companies::Admin::CourseRowSection, "table#courses tr.course"
end
