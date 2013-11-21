class Category::Hub < ActiveRecord::Base
  belongs_to :category
  has_many :topic_hubs, class_name: "Topic::Hub", foreign_key: "category_hub_id"
  has_many :topics, through: :topic_hubs

  validates :name, presence: true

  def to_s
    name
  end
end
