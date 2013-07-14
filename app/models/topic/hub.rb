class Topic::Hub < ActiveRecord::Base
  belongs_to :topic
  belongs_to :category_hub, class_name: Category::Hub
end
