class User < ActiveRecord::Base
  include Authority::UserAbilities

  has_secure_password validations: false

  has_many :authorizations, dependent: :destroy

  validates :email, uniqueness: true, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true

  # after_validation :report_validation_errors_to_rollbar

  mount_uploader :avatar, AvatarUploader

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active

    event :confirm do
      transition [:waiting_confirmation, :inactive] => :active
    end

    event :deactivate do
      transition [:waiting_confirmation, :active] => :inactive
    end

  end

  include UserRepository

  mix :creator_role do
    has_many :companies, foreign_key: :creator_id
    has_many :courses, foreign_key: :creator_id
  end

  mix :member_role do
    has_many :course_members, -> { joins(:course).merge(Course.published) }, class_name: 'Course::Member', dependent: :destroy
    has_many :learn_courses, through: :course_members, source: :course
    has_many :learn_lessons, through: :learn_courses, source: :lessons, class_name: Course::Lesson
  end

  mix :manager_role do
    has_many :company_managers, dependent: :destroy, class_name: Company::Manager
    has_many :manage_in, through: :company_managers, source: :company
  end

  mix :teacher_role do
    has_many :teach_courses, class_name: Course,
      foreign_key: :teacher_id, dependent: :restrict_with_exception
    has_many :company_teachers, -> { confirmed }, dependent: :destroy, class_name: Company::Teacher
    has_many :course_teachers, class_name: Course::Teacher, through: :company_teachers, dependent: :destroy
    has_many :teach_in, through: :company_teachers, source: :company

    def teacher?
      teach_in.any?
    end
  end

  def generate_confirmation_token
    self.confirmation_token = SecureHelper.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureHelper.generate_token
  end

  def can_reset_password?
    active?
  end

  def guest?
    false
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  def companies_where_i_work
    manage_in | teach_in
  end
end
