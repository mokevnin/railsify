class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.string :state
      t.string :processing_state
      t.references :creator, index: true
      t.references :course, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
