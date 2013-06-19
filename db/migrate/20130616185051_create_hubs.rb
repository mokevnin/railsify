class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :name

      t.timestamps
    end
  end
end
