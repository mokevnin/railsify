class RemoveFinishFromCourseLessons < ActiveRecord::Migration
  def change
    remove_column :course_lessons, :finish
  end
end
