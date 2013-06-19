class TopicCommentType < Topic::Comment
  include BaseType

  permit :body
end
