class TopicType < Topic
  include ApplicationType

  permit :name, :body, :state_event, category_hub_ids: []
end
