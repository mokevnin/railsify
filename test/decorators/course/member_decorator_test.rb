require 'test_helper'

class CourseMemberDecoratorTest < ActiveSupport::TestCase
  setup do
    @course = create :course
    @member = @course.members.last.decorate
  end

  test "#attendance_percentage for course without lessons" do
    @course.lessons.delete_all
    assert { @member.attendance_percentage == 0 }
  end
end
