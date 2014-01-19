class Web::Companies::Admin::Lessons::AttendantsController < Web::Companies::Admin::Lessons::ApplicationController
  def index
    @attendants = Set.new resource_lesson.attendants.map(&:member_id)

    add_breadcrumb resource_lesson.course, edit_company_admin_offline_course_path(resource_lesson.course)
    add_breadcrumb :lectures, company_admin_lessons_path(q: {course_id_eq: resource_lesson.course})
    add_breadcrumb resource_lesson, company_admin_lesson_attendants_path(resource_lesson)
  end
end
