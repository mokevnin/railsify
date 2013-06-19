class AccountTopicType < Topic
  include BaseType

  permit :name, :body
end
