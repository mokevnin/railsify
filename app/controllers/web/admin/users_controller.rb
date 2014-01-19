class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = User.ransack(query)
    @users = @search.result(distinct: true).page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = @user.becomes AdminUserEditType

    if @user.update(params[:user])
      f(:success)
      redirect_to action: 'index'
    else
      f(:error)
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    #FIXME почему т о дестрой не хочет работать
    user.delete
    redirect_to admin_users_path
  end
end
