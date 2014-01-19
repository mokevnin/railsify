class ChangeDescriptionTypeToText < ActiveRecord::Migration
  def change
    change_column :course_lessons, :description, :text, length: 4000
  end
end
