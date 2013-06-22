class Category < ActiveRecord::Base
  has_many :hubs
  has_many :topics, through: :hubs
end
