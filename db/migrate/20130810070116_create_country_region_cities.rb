class CreateCountryRegionCities < ActiveRecord::Migration
  def change
    create_table :country_region_cities do |t|
      t.references :region, index: true
      t.string :name

      t.timestamps
    end
  end
end
