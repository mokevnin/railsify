class CreateCompanyManagers < ActiveRecord::Migration
  def change
    create_table :company_managers do |t|
      t.references :company, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
