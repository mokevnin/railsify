require 'test_helper'

class Web::CoursesTest < ActionDispatch::IntegrationTest
  setup do
    user = create :user
    @company = create :company, creator: user
    @attrs = attributes_for :course
    @course = create :offline_course, creator: user, company: @company
  end

  test "#index" do
    Courses::IndexPage.visit
    assert_response :ok
  end
end
