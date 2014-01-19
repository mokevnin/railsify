class Companies::Admin::Lessons::Attendants::IndexPage < ApplicationPage
  set_url '/admin/lessons/{lesson_id}/attendants'

  element :switchers, ".make-switch"
  element :attendants_list_link, "#attendants_list"
end
