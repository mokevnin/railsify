class CreateCompanyPages < ActiveRecord::Migration
  def change
    create_table :company_pages do |t|
      t.references :company
      t.references :creator
      t.string :state
      t.string :slug
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end
