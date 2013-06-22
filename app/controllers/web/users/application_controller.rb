class Web::Users::ApplicationController < Web::ApplicationController
  helper_method :resource_user

  private

  def resource_user
    @resource_user ||= User.active.where(login: params[:user_id]).first!
  end
end
