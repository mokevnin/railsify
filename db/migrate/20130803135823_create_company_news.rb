class CreateCompanyNews < ActiveRecord::Migration
  def change
    create_table :company_news do |t|
      t.references :company
      t.references :creator
      t.string :state
      t.string :published_at
      t.string :slug
      t.string :name
      t.string :body
      t.string :picture

      t.timestamps
    end
  end
end
