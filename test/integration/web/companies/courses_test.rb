require 'test_helper'

class Web::Companies::CoursesTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @company = create :company, creator: @user
    @course = create :offline_course, company: @company

    subdomain @company.login
  end

  test "#nearest" do
    ::Companies::Courses::NearestPage.visit
    assert_response :ok
  end

  test "#finished" do
    ::Companies::Courses::FinishedPage.visit
    assert_response :ok
  end

  test "#show" do
    ::Companies::Courses::ShowPage.visit id: @course.id
    assert_response :ok
  end

  test "#show with auth" do
    ::Sessions::NewPage.sign_in(@user)
    @course.member_users << @user

    ::Companies::Courses::ShowPage.visit id: @course.id
    assert_response :ok
  end
end
