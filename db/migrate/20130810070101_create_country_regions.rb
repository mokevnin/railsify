class CreateCountryRegions < ActiveRecord::Migration
  def change
    create_table :country_regions do |t|
      t.references :country, index: true
      t.string :name

      t.timestamps
    end
  end
end
