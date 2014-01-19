class AddMemberIdToCourseLessonAttendants < ActiveRecord::Migration
  def change
    add_column :course_lesson_attendants, :member_id, :integer
  end
end
