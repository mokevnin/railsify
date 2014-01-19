class AddPresentationToCourseLessons < ActiveRecord::Migration
  def change
    add_column :course_lessons, :presentation, :string
  end
end
