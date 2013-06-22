class UserPasswordEditType < User
  include BaseType

  permit :password, :password_confirmation

  validates :password, presence: true
end
