class AdminUserEditType < User
  include ApplicationType

  permit :email, :first_name, :description, :last_name, :password, :password_confirmation, :state_event

end
