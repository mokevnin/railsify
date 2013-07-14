class CreateTopicHubs < ActiveRecord::Migration
  def change
    create_table :topic_hubs do |t|
      t.references :topic, index: true
      t.references :category_hub, index: true

      t.timestamps
    end
  end
end
