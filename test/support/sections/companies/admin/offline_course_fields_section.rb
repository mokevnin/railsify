class Companies::Admin::OfflineCourseFieldsSection < ApplicationSection
  element :state_event, "#offline_course_state_event"
  element :name, "#offline_course_name"
  element :submit, "input[name=commit]"

  sections :lesson_fields, Companies::Admin::LessonOfflineFieldsSection, ".nested-fields"

  element :add_lesson_link, ".add_fields"
end
