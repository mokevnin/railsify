class TopicFieldsSection < SitePrism::Section
  element :name, "#topic_name"
  element :body, "#topic_body"
  element :category_hub_ids, "#topic_category_hub_ids"

  element :submit, "input[name=commit]"
end
