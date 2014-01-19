class Web::PasswordsController < Web::ApplicationController
  def edit
    return redirect_to(root_path) unless params[:reset_password_token]
    user = User.where(params.extract(:reset_password_token)).first!
    @user = user.becomes(UserPasswordType)
  end

  def update
    return redirect_to(root_path) unless params[:reset_password_token]
    user = User.where(params.extract(:reset_password_token)).first!
    @user = user.becomes(UserPasswordType)
    if @user.update(params[:user])
      f(:success)
      redirect_to root_path
    else
      f(:error)
      render action: :edit
    end
  end
end
