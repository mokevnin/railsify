class ChangeBodyTypeInCompanyNews < ActiveRecord::Migration
  def change
    change_column :company_news, :body, :text, length: 4000
  end
end
