class Web::Account::PasswordsController < Web::Account::ApplicationController
  add_breadcrumb :edit, :edit_account_password

  def edit
    @user = UserPasswordConfirmationType.new
  end

  def update
    @user = current_user.becomes(UserPasswordConfirmationType)
    if @user.update(params[:user])
      sign_in @user
      f(:success)
      return redirect_to root_path
    end

    f(:error)
    render :edit
  end

end
