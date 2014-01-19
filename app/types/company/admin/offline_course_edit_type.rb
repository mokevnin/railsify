class Company::Admin::OfflineCourseEditType < OfflineCourse

  include ApplicationType

  permit :name, :description, :state_event, :course_state_event, :subscription_state_event, :description, :image,
    :begins, :city_id, :address_street, :address_description, :maximum_members_count, company_teacher_ids: [],
    lessons_attributes: [:id, :presentation, :name, :description, :_destroy, :start, :duration]
end
