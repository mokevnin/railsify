module Company::TeacherRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    has_many :online_courses, -> { where(type: OnlineCourse) }, through: :course_teachers, source: :course
    has_many :offline_courses, -> { where(type: OfflineCourse) }, through: :course_teachers, source: :course

    has_many :not_finished_courses, ->{ published.course_not_finished }, through: :course_teachers, source: :course
    has_many :finished_courses, ->{ published.course_finished }, through: :course_teachers, source: :course

    scope :web, -> { confirmed.order(created_at: :desc) }
  end
end
