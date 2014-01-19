class Web::RemindPasswordsController < Web::ApplicationController

  def new
    @form = UserPasswordRemindType.new
  end

  def create
    @form = UserPasswordRemindType.new params[:user_password_remind_type]
    if @form.valid?
      user = @form.user
      if user.can_reset_password?
        user.generate_reset_password_token
        user.save!
        UserMailer.remind_password(user).deliver
        f(:success)
        return redirect_to root_path
      end
    end

    render :new
  end

end