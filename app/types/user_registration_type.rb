class UserRegistrationType < User
  include BaseType

  permit :login, :email, :password, :password_confirmation
end
