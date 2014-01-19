class Company::TeacherDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user
  decorates_association :courses, scope: :published
  decorates_association :not_finished_courses
  decorates_association :finished_courses

  delegate :full_name, to: :user
end
