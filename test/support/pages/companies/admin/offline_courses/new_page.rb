class Companies::Admin::OfflineCourses::NewPage < ApplicationPage
  set_url url_helpers.new_company_admin_offline_course_path

  section :course_fields, Companies::Admin::OfflineCourseFieldsSection, "form.simple_form"

  def create(attrs)
    f = course_fields
    f.name.set attrs[:name]
    f.add_lesson_link.click

    lf = f.lesson_fields.first
    lf.name.set attrs[:name]

    f.submit.click
  end
end
