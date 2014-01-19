class MoveTeachers < ActiveRecord::Migration
  def up
    Course.find_each do |c|
      next unless c.teacher_id?
      t = c.teachers.build(user_id: c.teacher_id)
      t.save(validate: false)
    end
  end

  def down
    Course::Teacher.destroy_all
  end
end
