class FillStateInCompanyTeachers < ActiveRecord::Migration
  def change
    Company::Teacher.where(state: nil).update_all(state: :confirmed)
  end
end
