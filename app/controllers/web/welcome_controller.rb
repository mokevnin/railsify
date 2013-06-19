class Web::WelcomeController < Web::ApplicationController
  def index
    @topics = Topic.published.page(params[:page])
  end
end
