class Company::Admin::CourseLessonType < Course::Lesson
  include ApplicationType

  permit :name, :description, :state_event, :description,
    :start, :presentation
end
