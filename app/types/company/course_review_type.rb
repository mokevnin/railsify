class Company::CourseReviewType < Course::Review
  include ApplicationType

  permit :body, :state_event
end
