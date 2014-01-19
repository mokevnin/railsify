class Web::SessionsController < Web::ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      user = @session.user
      sign_in(user)
      f(:success)
      try_redirect_to_from_or root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    f(:success)
    try_redirect_to_from_or root_path
  end
end
