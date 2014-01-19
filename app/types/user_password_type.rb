class UserPasswordType < User
  include ApplicationType

  permit :password, :password_confirmation

  validates :password, presence: true
end
