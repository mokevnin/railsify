class Company < ActiveRecord::Base
  include Authority::Abilities

  has_many :teachers, dependent: :destroy
  has_many :teacher_users, through: :teachers, source: :user

  has_many :managers, dependent: :destroy
  has_many :manager_users, through: :managers, source: :user

  has_many :courses
  has_many :course_lessons, through: :courses, source: :lessons, class_name: Course::Lesson
  has_many :offline_courses, class_name: OfflineCourse
  has_many :online_courses, class_name: OnlineCourse
  has_many :course_members, through: :courses, source: :members, class_name: Course::Member
  has_many :course_reviews, through: :courses, source: :reviews, class_name: Course::Review
  has_many :lessons, through: :courses, class_name: Course::Lesson

  has_many :domains, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :pages, -> { order(order: :asc) }, dependent: :destroy
  has_many :mailing_lists, through: :courses, dependent: :destroy

  belongs_to :creator, class_name: 'User'

  validates :name, presence: true
  #TODO refactor excluded domains
  validates :login, uniqueness: true, presence: true, slug: true, exclusion: %w(www admin mail), format: /\A[a-z0-9]+\Z/
  validates :creator, presence: true
  validates :public_email, email: true, allow_blank: true

  accepts_nested_attributes_for :domains, reject_if: :all_blank, allow_destroy: true

  before_create :add_creator_to_management

  mount_uploader :logo, ::LogoUploader

  state_machine initial: :inactive do
    state :inactive
    state :active

    event :activate do
      transition [:inactive] => :active
    end

    event :deactivate do
      transition [:active] => :inactive
    end
  end

  include CompanyRepository

  def to_s
    name
  end

  private

  def add_creator_to_management
    managers.build user: creator
  end
end
