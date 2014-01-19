class Company::Admin::CompanyManagerEditType < Company::Manager
  include ApplicationType

  permit :user_id
end
