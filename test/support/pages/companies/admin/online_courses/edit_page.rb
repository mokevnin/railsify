class Companies::Admin::OnlineCourses::EditPage < ApplicationPage
  set_url '/admin/online_courses/{id}/edit'

  section :course_fields, Companies::Admin::OnlineCourseFieldsSection, "form.simple_form"

  def update(attrs)
    f = course_fields
    f.name.set attrs[:name]
    if attrs[:state_event]
      f.state_event.select OnlineCourse.human_state_event_name(attrs[:state_event])
    end
    f.submit.click
  end
end
