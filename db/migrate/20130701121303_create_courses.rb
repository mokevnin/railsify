class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :company
      t.belongs_to :creator
      t.belongs_to :teacher
      t.string :type
      t.string :state
      t.string :subscription_state
      t.string :name
      t.text :description
      t.references :country_region_city
      t.string :address

      t.timestamps
    end
  end
end
