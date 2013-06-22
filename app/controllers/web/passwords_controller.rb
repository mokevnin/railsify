class Web::PasswordsController < Web::ApplicationController
  def new
    @form = PasswordConfirmationType.new
  end

  def create
    @form = PasswordConfirmationType.new(params[:password_confirmation_type])
    if @form.valid?
      user = @form.user
      user.generate_reset_password_token
      user.reset_password_sent_at = Time.current
      user.save! #NOTE если тут не засейвится это значит мы накосячили в логике
      UserMailer.reset_password_instructions(user).deliver
      f(:success)
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    return redirect_to(root_path) unless params[:reset_password_token]
    user = User.where(params.extract(:reset_password_token)).first!
    @user = user.becomes(UserPasswordEditType)
  end

  def update
    return redirect_to(root_path) unless params[:reset_password_token]
    user = User.where(params.slice(:reset_password_token)).first!
    @user = user.becomes(UserPasswordEditType)
    if @user.update_attributes(params[:user])
      f(:success)
      redirect_to root_path
    else
      f(:error)
      render action: :edit
    end
  end
end
