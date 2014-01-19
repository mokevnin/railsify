class Companies::Admin::Members::NewPage < ApplicationPage
  set_url url_helpers.new_company_admin_member_path

  element :users_list, "#course_member_user_id_chosen"
  elements :users, "#course_member_user_id_chosen .active-result"
  element :courses_list, "#course_member_course_id_chosen"
  elements :courses, "#course_member_course_id_chosen .active-result"
  element :submit, "input[name=commit]"

  def create(user, course)
    users_list.click
    users.detect{|e| e.text == user.to_s}.click
    courses_list.click
    courses.detect{|e| e.text == course.to_s}.click

    submit.click
  end
end
