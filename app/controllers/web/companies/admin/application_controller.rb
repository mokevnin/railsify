class Web::Companies::Admin::ApplicationController < Web::Companies::ApplicationController

  before_filter do
    forbid(params[:controller]) unless current_user.can_manage?(resource_company)
  end
end
