class CreateCourseTeachers < ActiveRecord::Migration
  def change
    create_table :course_teachers do |t|
      t.references :course, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
