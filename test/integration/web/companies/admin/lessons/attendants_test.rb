require 'test_helper'

class Web::Companies::Admin::Lessons::AttendantsTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = @company.offline_courses.last
    @lesson = @course.lessons.last
    @course.members.delete_all
    @member = @course.members.create user: @user

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#create" do
    p = ::Companies::Admin::Lessons::Attendants::IndexPage.visit lesson_id: @lesson.id
    p.switchers.click
    p.wait_for_ajax

    assert { @lesson.attendants.exists?(member: @member) }
  end

  test "#destroy" do
    @lesson.attendants.create member: @member

    p = ::Companies::Admin::Lessons::Attendants::IndexPage.visit lesson_id: @lesson.id
    p.switchers.click
    p.wait_for_ajax

    assert { !@lesson.attendants.exists?(member: @member) }
  end

  test "get csv" do
    p = ::Companies::Admin::Lessons::Attendants::IndexPage.visit lesson_id: @lesson.id
    p.attendants_list_link.click
    #FIXME надо что то проверять)
  end
end
