class TopicType < Topic
  include BaseType

  permit :name, :body
end
