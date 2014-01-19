class Course::Lesson::Attendant < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :member

  #FIXME добавить ключ в базу
  validates :member, presence: true
  #FIXME поправить после релиза новых рельс
  validates :member_id, uniqueness: {scope: :lesson_id}
  validates :lesson, presence: true
end
