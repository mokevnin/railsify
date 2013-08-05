class TopicCommentType < Topic::Comment
  include ApplicationType

  permit :body
end
