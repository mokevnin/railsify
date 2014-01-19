class InitCourseState < ActiveRecord::Migration
  def change
    Course.where(course_state: nil).update_all(course_state: :not_finished)
  end
end
