module Course::TeacherRepository
  extend ActiveSupport::Concern

  included do
    #NOTE использование Relation#merge
    scope :published, -> { joins(:course).merge(Course.published) }
  end
end
