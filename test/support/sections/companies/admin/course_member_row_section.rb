class Companies::Admin::CourseMemberRowSection < ApplicationSection
  element :full_name_cell, ".course_member_full_name"
  element :switcher, ".make-switch"

  def full_name
    full_name_cell.text
  end
end
