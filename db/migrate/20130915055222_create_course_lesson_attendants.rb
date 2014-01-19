class CreateCourseLessonAttendants < ActiveRecord::Migration
  def change
    create_table :course_lesson_attendants do |t|
      t.references :user, index: true
      t.references :lesson, index: true
    end
  end
end
