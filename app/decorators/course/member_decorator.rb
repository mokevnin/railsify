class Course::MemberDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user
  decorates_association :course

  delegate :full_name, to: :user

  def attendance
    "#{attendant_on_lessons.count}/#{course.lessons.count}"
  end

  def attendance_percentage
    return 0 if course.lessons.empty?
    (attendant_on_lessons.count.to_f / course.lessons.count.to_f * 100).to_i
  end
end
