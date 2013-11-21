class UserMailer < ApplicationMailer
  def confirmation_instructions(user)
    @user = user.decorate
    #FIXME в шаблоне нихрена не работает
    @url = confirm_user_path(@user, confirmation_token: user.confirmation_token)
    mail(to: user.email)
  end

  def reset_password_instructions(user)
    @user = user

    mail(to: user.email)
  end
end
