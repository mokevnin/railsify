class Companies::Admin::Members::IndexPage < ApplicationPage
  set_url url_helpers.company_admin_members_path

  sections :members, Companies::Admin::CourseMemberRowSection, "tr.course_member"

  def switch(member)
    member = members.detect{|m| m.full_name == member.full_name}
    member.switcher.click
    wait_for_ajax
  end
end
