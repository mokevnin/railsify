class CreateCompanyTeachers < ActiveRecord::Migration
  def change
    create_table :company_teachers do |t|
      t.belongs_to :company
      t.belongs_to :user
      t.belongs_to :creator
      t.timestamps
    end
  end
end
