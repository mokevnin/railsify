class ChangeDescriptionTypeInCourse < ActiveRecord::Migration
  def change
    change_column :courses, :description, :text, length: 4000
  end
end
