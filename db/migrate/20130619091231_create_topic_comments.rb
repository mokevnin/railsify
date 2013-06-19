class CreateTopicComments < ActiveRecord::Migration
  def change
    create_table :topic_comments do |t|
      t.references :creator
      t.references :topic
      t.string :state
      t.string :body

      t.timestamps
    end
  end
end
