class ChangeBodyTypeInCompanyPage < ActiveRecord::Migration
  def change
    change_column :company_pages, :body, :text, length: 4000
  end
end
