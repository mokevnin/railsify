class UserRegistrationType < User
  include ApplicationType

  has_secure_password

  permit :login, :email, :password, :password_confirmation
end
