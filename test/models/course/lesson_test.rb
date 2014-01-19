require 'test_helper'

class Course::LessonTest < ActiveSupport::TestCase
  setup do
    @course = create(:course)
  end
end
