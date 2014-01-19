class CreateCourseMembers < ActiveRecord::Migration
  def change
    create_table :course_members do |t|
      t.belongs_to :course
      t.belongs_to :user
      t.timestamps
    end
  end
end
