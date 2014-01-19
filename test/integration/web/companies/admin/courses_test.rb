require 'test_helper'

class Web::Companies::Admin::CoursesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = @company.courses.first

    ::Sessions::NewPage.sign_in(@user)
    subdomain @company.login
  end

  test "#index" do
    ::Companies::Admin::Courses::IndexPage.visit
    assert_response :ok
  end

  test "switch state" do
    p = ::Companies::Admin::Courses::IndexPage.visit

    c = p.courses.last
    c.state_button.click
    p.load

    @course.reload

    assert { @course.unpublished? }
  end

  test "switch course state" do
    p = ::Companies::Admin::Courses::IndexPage.visit

    c = p.courses.last
    c.course_state_button.click
    p.load

    @course.reload

    assert { @course.course_finished? }
  end
end
