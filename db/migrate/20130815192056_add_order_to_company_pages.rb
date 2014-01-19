class AddOrderToCompanyPages < ActiveRecord::Migration
  def change
    add_column :company_pages, :order, :integer
  end
end
