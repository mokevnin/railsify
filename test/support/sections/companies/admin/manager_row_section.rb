class Companies::Admin::ManagerRowSection < ApplicationSection
  element :full_name_cell, ".manager_full_name"
  element :destroy_link, ".destroy-manager"

  def full_name
    full_name_cell.text
  end
end
