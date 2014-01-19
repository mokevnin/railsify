class AddStateToCompanyTeachers < ActiveRecord::Migration
  def change
    add_column :company_teachers, :state, :string
  end
end
