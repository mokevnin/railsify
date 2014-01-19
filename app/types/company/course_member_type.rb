class Company::CourseMemberType < Course::Member
  include ApplicationType

  permit :course_state_event
end
