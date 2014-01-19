class SetupDefaultDurationToCourseLessons < ActiveRecord::Migration
  def change
    Course::Lesson.where(duration: nil).update_all(duration: 60)
  end
end
