class CourseDecorator < ApplicationDecorator
  delegate_all
  decorates_association :lessons
  decorates_association :members
  decorates_association :sorted_lessons

  def full_address
    result = "#{address}"
    result << " (#{address_description})" if address_description?

    result
  end

  def members_with_max
    result = members.count.to_s
    if maximum_members_count
      result << "/#{maximum_members_count}"
    end

    result
  end

  def short_description
    return "" if description.blank?
    h.simple_format(h.truncate(h.strip_tags(description).html_safe, length: 200, escape: false))
  end

  def dates
    start = course.lessons.first.start
    finish = course.lessons.last.start

    "#{h.l start, format: :day_month_year} - #{h.l finish, format: :day_month_year}"
  end
end
