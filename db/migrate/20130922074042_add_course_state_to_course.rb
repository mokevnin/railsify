class AddCourseStateToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_state, :string
  end
end
