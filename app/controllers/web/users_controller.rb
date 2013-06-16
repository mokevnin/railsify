class Web::UsersController < Web::ApplicationController
  def index
    @users = User.active.page(params[:page])
  end

  def show
    @user = User.active.find(params[:id])
  end
end
