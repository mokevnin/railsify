class Companies::Courses::ShowPage < ApplicationPage
  set_url '/courses/{id}'

  element :review_link, "#review_link"
  element :subscribe_to_course_link, "#subscribe_to_course"
  element :unsubscribe_to_course_link, "#unsubscribe_to_course"
end
