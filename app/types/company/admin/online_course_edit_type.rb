class Company::Admin::OnlineCourseEditType < OnlineCourse
  include ApplicationType

  permit :name, :image, :description, :maximum_members_count, :state_event, :course_state_event,
    :subscription_state_event, :description, :begins, company_teacher_ids: [],
    lessons_attributes: [:id, :name, :description, :_destroy, :start, :finish]
end
