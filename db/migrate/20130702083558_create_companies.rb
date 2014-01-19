class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :state
      t.belongs_to :creator
      t.string :login, unique: true
      t.string :description
      t.string :logo

      t.timestamps
    end
  end
end
