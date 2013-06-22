class UserMailer < BaseMailer
  def confirmation_instructions(user)
    @user = user
    mail(to: user.email)
  end

  def reset_password_instructions(user)
    @user = user
    mail(to: user.email)
  end
end
