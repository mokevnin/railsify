class Web::Account::ProfilesController < Web::Account::ApplicationController
  add_breadcrumb :edit, :edit_account_profile

  def edit
    @user = current_user.becomes(::Account::UserProfileType)
  end

  def update
    @user = current_user
    @user = @user.becomes(::Account::UserProfileType)
    if @user.update(params[:user])
      f(:success)
      redirect_to action: 'edit'
    else
      f(:error)
      render :edit
    end
  end

end
