class ChangeDescriptionTypeInCompany < ActiveRecord::Migration
  def change
    change_column :companies, :description, :text, length: 4000
  end
end
