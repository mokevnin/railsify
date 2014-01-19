require 'test_helper'

class Course::TeacherTest < ActiveSupport::TestCase
  setup do
    @course = create :offline_course
    @company = @course.company
    @user = create :user
  end

  test "teacher validation" do
    t = @course.teachers.build company_teacher: @company.teachers.last
    assert { !t.valid? }
  end
end
