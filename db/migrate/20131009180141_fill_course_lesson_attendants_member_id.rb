class FillCourseLessonAttendantsMemberId < ActiveRecord::Migration
  def change
    Course::Lesson::Attendant.find_each do |at|
      at.member = at.lesson.members.find_by user_id: at.user_id
      at.save
    end
  end
end
