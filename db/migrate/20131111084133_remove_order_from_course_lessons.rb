class RemoveOrderFromCourseLessons < ActiveRecord::Migration
  def change
    remove_column :course_lessons, :order
  end
end
