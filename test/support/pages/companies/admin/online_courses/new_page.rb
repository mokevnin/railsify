class Companies::Admin::OnlineCourses::NewPage < ApplicationPage
  set_url url_helpers.new_company_admin_online_course_path

  section :course_fields, Companies::Admin::OnlineCourseFieldsSection, "form.simple_form"

  def create(attrs)
    f = course_fields
    f.name.set attrs[:name]
    if attrs[:state_event]
      f.state_event.select OnlineCourse.human_state_event_name(attrs[:state_event])
    end
    f.add_lesson_link.click
    lf = f.lesson_fields.first
    lf.name.set attrs[:name]

    f.submit.click
  end
end
