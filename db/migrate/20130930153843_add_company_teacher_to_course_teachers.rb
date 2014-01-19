class AddCompanyTeacherToCourseTeachers < ActiveRecord::Migration
  def change
    add_column :course_teachers, :company_teacher_id, :integer
  end
end
