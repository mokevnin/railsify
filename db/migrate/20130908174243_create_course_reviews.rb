class CreateCourseReviews < ActiveRecord::Migration
  def change
    create_table :course_reviews do |t|
      t.references :creator, index: true
      t.references :course, index: true
      t.string :state
      t.text :body

      t.timestamps
    end
  end
end
