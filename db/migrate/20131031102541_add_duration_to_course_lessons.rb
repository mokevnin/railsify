class AddDurationToCourseLessons < ActiveRecord::Migration
  def change
    add_column :course_lessons, :duration, :integer
  end
end
