class UserSignInType
  include ApplicationTypeWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :password, presence: true

  validate :check_authenticate, if: :email
  validate :check_banned_user, if: :email
  validate :check_new_user, if: :email

  def user
    ::User.where(email: email.mb_chars.downcase).first
  end

  private

  def check_authenticate
    if !user.try(:authenticate, password)
      errors.add(:password, :user_or_password_invalid)
    end
  end

  def check_banned_user
    if user.try(:inactive?)
      errors.add(:email, :user_inactive)
    end
  end

  def check_new_user
    if user.try(:waiting_confirmation?)
      errors.add(:email, :user_new)
    end
  end

end
