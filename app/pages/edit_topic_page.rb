class EditTopicPage < ApplicationPage
  set_url '/topics/{id}/edit'

  section :topic_fields, TopicFieldsSection, ".simple_form"

  def update_topic(attrs)
    [:name, :body].each do |name|
      topic_fields.send(name).set attrs[name]
    end

    topic_fields.submit.click
  end
end
