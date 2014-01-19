require 'test_helper'

class Web::Companies::Admin::OfflineCoursesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = @company.offline_courses.last

    @attrs = attributes_for :offline_course

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#new #create" do
    p = ::Companies::Admin::OfflineCourses::NewPage.visit
    p.create(@attrs)

    course = @company.offline_courses.find_by name: @attrs[:name]
    assert { course }
  end

  test "#edit #update" do
    p = ::Companies::Admin::OfflineCourses::EditPage.visit(id: @course.id)
    p.update(@attrs)

    @course.reload
    assert { @attrs[:name] == @course.name }
  end
end
