class ChangePublishedAtTypeInCompanyNews < ActiveRecord::Migration
  def change
    remove_column :company_news, :published_at
    add_column :company_news, :published_at, :datetime
  end
end
