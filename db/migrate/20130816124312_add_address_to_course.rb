class AddAddressToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :city, index: true
    rename_column :courses, :address, :address_street
    add_column :courses, :address_description, :string
  end
end
