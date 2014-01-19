class Company::Teacher < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :course_teachers, class_name: Course::Teacher,
    foreign_key: :company_teacher_id
  has_many :courses, through: :course_teachers

  validates :company, presence: true
  validates :user, presence: true, uniqueness: {scope: :company}

  delegate :to_s, :avatar, :avatar?, :description, :email,
    to: :user

  state_machine initial: :awaiting do
    state :awaiting
    state :confirmed
    state :disabled

    event :confirm do
      transition [:awaiting, :disabled] => :confirmed
    end

    event :disable do
      transition [:awaiting, :confirmed] => :disabled
    end
  end

  include Company::TeacherRepository
end
