class Company::Domain < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
