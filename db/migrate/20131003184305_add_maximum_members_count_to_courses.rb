class AddMaximumMembersCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :maximum_members_count, :integer
  end
end
