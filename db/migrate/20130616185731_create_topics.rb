class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :creator
      t.string :state
      t.string :published_at
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
