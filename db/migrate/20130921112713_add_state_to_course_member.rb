class AddStateToCourseMember < ActiveRecord::Migration
  def change
    add_column :course_members, :course_state, :string
  end
end
