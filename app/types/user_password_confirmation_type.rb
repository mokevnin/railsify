class UserPasswordConfirmationType < User
  include ApplicationType

  has_secure_password

  permit :password, :password_confirmation

  validates :password, presence: true
  validates :password_confirmation, presence: true
end
