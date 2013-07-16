class TopicFieldsSection < SitePrism::Section
  element :name, "#topic_name"
  element :body, "#topic_body"
  #TODO заменить на id
  element :category_hubs_chosen, 'input[value="Select Some Options"]'

  element :submit, "input[name=commit]"

  def category_hubs_list
    category_hubs_chosen.click
    all(".active-result")
  end
end
