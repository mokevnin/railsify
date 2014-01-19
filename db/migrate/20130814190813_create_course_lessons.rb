class CreateCourseLessons < ActiveRecord::Migration
  def change
    create_table :course_lessons do |t|
      t.references :course, index: true
      t.references :creator, index: true
      t.string :state
      t.integer :order
      t.datetime :start
      t.datetime :finish
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
