class Course::LessonDecorator < ApplicationDecorator
  delegate_all
  decorates_association :course

  def date
    if start?
      h.l start, format: :short
    end
  end

  def formatted_duration
    "#{h.pluralize duration, h.t("minute"), h.t("minutess")}"
  end

  def start_date
    start.try :to_date
  end

  def short_description
    h.truncate(h.strip_tags(h.simple_format(description)), length: 200)
  end

  def members_who_visited_count
    "#{attendants.count}/#{course.members.count}"
  end
end
