class TopicType < Topic
  include BaseType

  permit :name, :body, :state_event, category_hub_ids: []
end
