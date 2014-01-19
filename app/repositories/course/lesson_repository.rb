module Course::LessonRepository
  extend ActiveSupport::Concern

  included do
    scope :nearest, ->(days_count = 60) {
      joins(:course).merge(Course.published) \
      .where(start: Time.current..(Time.current + days_count.days)) \
      .order(start: :asc) }

    scope :half_day, -> { where(start: Time.current..(Time.current + 12.hours)) }
  end
end
