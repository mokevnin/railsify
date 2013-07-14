class NewTopicPage < ApplicationPage
  set_url url_helpers.new_topic_path

  section :topic_fields, TopicFieldsSection, "#new_topic"

  def create_topic(t)
    [:name, :body].each do |name|
      topic_fields.send(name).set t.send(name)
    end
    topic_fields.category_hub_ids.select t.category_hubs.first.name

    topic_fields.submit.click
  end
end
