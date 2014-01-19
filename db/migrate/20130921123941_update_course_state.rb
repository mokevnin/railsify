class UpdateCourseState < ActiveRecord::Migration
  def change
    Course::Member.where(course_state: nil).update_all(course_state: :started)
  end
end
