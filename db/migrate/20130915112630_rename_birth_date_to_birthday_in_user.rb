class RenameBirthDateToBirthdayInUser < ActiveRecord::Migration
  def change
    rename_column :users, :birth_date, :birthday
  end
end
