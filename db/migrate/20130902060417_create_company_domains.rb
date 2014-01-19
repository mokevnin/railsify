class CreateCompanyDomains < ActiveRecord::Migration
  def change
    create_table :company_domains do |t|
      t.references :company
      t.string :name

      t.timestamps
    end
  end
end
