require 'test_helper'

class Web::Companies::Courses::MembersTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = create :offline_course, company: @company

    ::Sessions::NewPage.sign_in(@user)

    subdomain @company.login
  end

  test "#create" do
    p = ::Companies::Courses::ShowPage.visit id: @course.id
    p.subscribe_to_course_link.click

    assert { @user.learn_courses.include?(@course) }
  end

  test "#destroy" do
    @course.member_users << @user

    p = ::Companies::Courses::ShowPage.visit id: @course.id
    p.unsubscribe_to_course_link.click

    assert { @user.learn_courses.exclude?(@course) }
  end
end
