class RemoveBrokenAttendants < ActiveRecord::Migration
  def change
    Course::Lesson::Attendant.where(member_id: nil).destroy_all
  end
end
