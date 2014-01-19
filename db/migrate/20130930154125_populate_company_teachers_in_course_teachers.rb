class PopulateCompanyTeachersInCourseTeachers < ActiveRecord::Migration
  def up
    Course::Teacher.find_each do |t|
      t.company_teacher = t.course.company.teachers.find_by(user_id: t.user_id)
      t.save!
    end
  end

  def down
    Course::Teacher.update_all(company_teacher_id: nil)
  end
end
