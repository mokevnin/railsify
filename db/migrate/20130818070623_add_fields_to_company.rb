class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :public_email, :string
    add_column :companies, :phone, :string
  end
end
