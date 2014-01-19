class Course::Teacher < ActiveRecord::Base
  include Course::TeacherRepository

  belongs_to :course
  belongs_to :company_teacher, class_name: Company::Teacher

  validates :course, presence: true
  validates :company_teacher, presence: true, uniqueness: {scope: :course}

  validate :check_company_teacher

  delegate :avatar, :avatar?, :description, to: :user
  delegate :user, :company, to: :company_teacher

  def to_s
    user.to_s
  end

  private

  def check_company_teacher
    if course.company != company_teacher.company
      errors.add(:company_teacher, :teacher_not_in_company)
    end
  end
end
