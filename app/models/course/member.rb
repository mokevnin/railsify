class Course::Member < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :course
  belongs_to :user

  has_many :course_lesson_attendants, class_name: Course::Lesson::Attendant, dependent: :destroy
  has_many :attendant_on_lessons, through: :course_lesson_attendants, source: :lesson

  validates :course, presence: true
  #TODO make uniq index
  validates :user, presence: true, uniqueness: {scope: :course}

  include Course::MemberRepository
end
