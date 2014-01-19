class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :region, index: true
      t.string :name

      t.timestamps
    end
  end
end
