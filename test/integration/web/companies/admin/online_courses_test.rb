require 'test_helper'

class Web::Companies::Admin::OnlineCoursesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = @company.online_courses.last

    @attrs = attributes_for :online_course

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#new #create" do
    p = ::Companies::Admin::OnlineCourses::NewPage.visit
    p.create(@attrs)

    course = @company.online_courses.find_by name: @attrs[:name]
    assert { course }
  end

  test "#edit #update" do
    p = ::Companies::Admin::OnlineCourses::EditPage.visit(id: @course.id)
    p.update(@attrs)

    @course.reload
    assert { @attrs[:name] == @course.name }
  end
end
