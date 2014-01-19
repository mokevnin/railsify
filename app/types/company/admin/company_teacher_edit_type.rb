class Company::Admin::CompanyTeacherEditType < Company::Teacher
  include ApplicationType

  permit :state_event

end
