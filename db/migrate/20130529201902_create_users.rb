class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password_digest
      t.string :state

      t.timestamps
    end
  end
end
