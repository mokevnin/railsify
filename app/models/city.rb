class City < ActiveRecord::Base
  belongs_to :region

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
