class Companies::Admin::OnlineCourseFieldsSection < ApplicationSection
  element :state_event, "#online_course_state_event"
  element :name, "#online_course_name"
  element :submit, "input[name=commit]"

  sections :lesson_fields, Companies::Admin::LessonOnlineFieldsSection, ".nested-fields"

  element :add_lesson_link, ".add_fields"
end
