class Category::Hub < ActiveRecord::Base
  belongs_to :category
  has_many :topics

  validates :name, presence: true
end
