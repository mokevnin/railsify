class Company::Manager < ActiveRecord::Base
  belongs_to :company
  belongs_to :user

  validates :company, presence: true
  # validates :user, presence: true, uniqueness: {scope: :company}
end
