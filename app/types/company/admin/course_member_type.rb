class Company::Admin::CourseMemberType < Course::Member
  include ApplicationType

  permit :course_id, :user_id
end
