class AddFacebookGroupLinkToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :facebook_group_link, :string
  end
end
