class CreateUserAuthorizations < ActiveRecord::Migration
  def change
    create_table :user_authorizations do |t|
      t.references :user
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
