class CreateHubs < ActiveRecord::Migration
  def change
    create_table :category_hubs do |t|
      t.references :category
      t.string :state
      t.string :name

      t.timestamps
    end
  end
end
