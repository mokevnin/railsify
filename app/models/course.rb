class Course < ActiveRecord::Base
  include Authority::Abilities

  has_many :members, dependent: :destroy
  has_many :member_users, through: :members, source: :user
  has_many :lessons, -> { order(start: :asc) }, inverse_of: :course
  has_many :reviews, dependent: :destroy
  has_many :mailing_lists, dependent: :destroy
  has_many :teachers, inverse_of: :course, dependent: :destroy
  has_many :company_teachers, through: :teachers, source: :company_teacher
  has_many :teacher_users, through: :company_teachers, source: :user

  belongs_to :company
  belongs_to :creator, class_name: User
  belongs_to :city

  validates :name, presence: true
  validates :company, presence: true
  validates :creator, presence: true

  accepts_nested_attributes_for :lessons, reject_if: :all_blank, allow_destroy: true

  mount_uploader :image, ::CourseImageUploader

  state_machine :state, initial: :unpublished do
    state :published
    state :unpublished
    state :archived

    event :publish do
      transition [:unpublished] => :published
    end

    event :unpublish do
      transition published: :unpublished
    end

    event :archive do
      transition unpublished: :archived
    end
  end

  state_machine :subscription_state, initial: :allowed, namespace: 'subscription' do
    state :allowed
    state :denied

    event :allow do
      transition denied: :allowed
    end

    event :deny do
      transition allowed: :denied
    end
  end

  state_machine :course_state, initial: :not_finished, namespace: 'course' do
    state :not_finished
    state :finished

    event :finish do
      transition not_finished: :finished
    end

    event :start do
      transition finished: :not_finished
    end
  end

  include CourseRepository

  def to_s
    name
  end

  def has_seat?
    return true if maximum_members_count.blank?
    members.count < maximum_members_count
  end

  #NOTE embedded value object
  def address
    @address ||= Address.new(city, address_street, address_description)
  end

  def start_date
    super rescue lessons.first.try(:start)
  end

  def started?
    return false unless start_date
    start_date < Time.current
  end

  def nearest_lesson_datetime
    super rescue lessons.nearest.first.try :start
  end
end
