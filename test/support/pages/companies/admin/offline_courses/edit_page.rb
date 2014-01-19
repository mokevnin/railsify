class Companies::Admin::OfflineCourses::EditPage < ApplicationPage
  set_url '/admin/offline_courses/{id}/edit'

  section :course_fields, Companies::Admin::OfflineCourseFieldsSection, "form.simple_form"

  def update(attrs)
    f = course_fields
    f.name.set attrs[:name]
    f.add_lesson_link.click

    lf = f.lesson_fields.last
    #FIXME replace attrs[:name]
    lf.name.set attrs[:name]

    f.submit.click
  end
end
