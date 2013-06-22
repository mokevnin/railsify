class Web::UsersController < Web::ApplicationController
  def index
    @q = User.active.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def show
    @user = User.active.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    @user.generate_confirmation_token
    @user.confirmation_sent_at = Time.current
    if @user.save
      UserMailer.confirmation_instructions(@user).deliver
      f(:success, now: true)
      redirect_to root_path
    else
      render :new
    end
  end

  def confirm
    return redirect_to(root_path) unless params[:confirmation_token]
    user = User.where(params.extract(:id, :confirmation_token)).first!
    if user.confirm
      sign_in user
      f(:success)
    else
      f(:error)
    end
    redirect_to root_path
  end
end
