class Web::WelcomeController < Web::ApplicationController
  def index
    redirect_to account_root_path if signed_in?
    @courses = Course.web.nearest.limit(10).decorate
  end
end
