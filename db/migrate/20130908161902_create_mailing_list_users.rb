class CreateMailingListUsers < ActiveRecord::Migration
  def change
    create_table :mailing_list_users do |t|
      t.references :mailing_list, index: true
      t.references :user, index: true
      t.string :state

      t.timestamps
    end
  end
end
