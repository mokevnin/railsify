class Course::Lesson < ActiveRecord::Base
  include Course::LessonRepository
  extend Enumerize

  enumerize :duration, in: [45, 60, 90, 120], default: 60
  mount_uploader :presentation, ::CourseLessonPresentationUploader

  belongs_to :course
  belongs_to :creator

  has_many :members, through: :attendants
  has_many :attendants, dependent: :destroy

  validates :course, presence: true
  #validates :creator, presence: true
  validates :name, presence: true, uniqueness: {scope: :course}

  def to_s
    name
  end

  def finished?
    Time.current > start
  end
end
